function accu = calculateMvpaAcrossHandExt(opt)

% main function which loops through masks and subjects to calculate the
% decoding accuracies for given conditions.
% dependant on SPM + CPP_SPM and CosMoMvpa toolboxes
% the output is compatible for R visualisation, it gives .csv file as well
% as .mat file 

  % get the smoothing parameter for 4D map
  funcFWHM = opt.funcFWHM;

  % choose masks to be used
%   opt = chooseMaskNEW(opt);
   

  % set output folder/name
  savefileMat = fullfile(opt.pathOutput, ...
                         [opt.taskName, ...
                         '_Ext',...
                          '_smoothing', num2str(funcFWHM), ...
                          '_ratio', num2str(opt.mvpa.ratioToKeep), ...
                          '_', datestr(now, 'yyyymmddHHMM'), '.mat']);


  %% MVPA options

  % set cosmo mvpa structure
  condLabelNb = [1 2 2 1 5 6 ];%[1 2 3 4 5 6 ];
  condLabelName = {'handDown_pinkyThumb', 'handDown_fingerWrist', 'handUp_pinkyThumb', 'handUp_fingerWrist', 'visual_vertical', 'visual_horizontal'};
  decodingConditionList = {'handDown_pinkyThumb_handUp_pinkyThumb_vs_handUp_fingerWrist_handDown_fingerWrist',...
      'handDown_pinkyThumb_handUp_fingerWrist_vs_handUp_pinkyThumb_handDown_fingerWrist'};

  %% let's get going!

  % set structure array for keeping the results
  accu = struct( ...
                'subID', [], ...
                'mask', [], ...
                'accuracy', [], ...
                'prediction', [], ...
                'maskVoxNb', [], ...
                'choosenVoxNb', [], ...
                'image', [], ...
                'ffxSmooth', [], ...
                'roiSource', [], ...
                'decodingCondition', [], ...
                'permutation', [], ...
                'imagePath', []);

  count = 1;

  for iSub = 1:numel(opt.subjects)

    % get FFX path
    subID = opt.subjects{iSub};
    ffxDir = getFFXdir(subID, funcFWHM, opt);

    % get subject folder name
    subFolder = ['sub-', subID];
    opt.maskPath = fullfile(fileparts(mfilename('fullpath')), '..','..', '..','derivatives' ,'cpp_spm-roi',subFolder);%,radiusFolder, radius);

    % masks to decode/use
    opt.maskName = {strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-lhMT_vox-200', '.nii'), ...
        strcat('sub-',num2str(subID),'_hemi-R_space-MNI_label-rhMT_vox-200', '.nii'), ...
        strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-lS1_vox-200', '.nii'), ...
        strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-lPC_vox-200', '.nii'), ...
        strcat('sub-',num2str(subID),'_hemi-R_space-MNI_label-rPC_vox-200', '.nii'), ...
        strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-lMTt_vox-200', '.nii'), ...
        strcat('sub-',num2str(subID),'_hemi-R_space-MNI_label-rMTt_vox-200', '.nii'),...
        };

    % use in output roi name
    opt.maskLabel = {'lhMT', 'rhMT', 'lS1', 'lPC', 'rPC','lMTt', 'rMTt'};

    for iImage = 1:length(opt.mvpa.map4D)

      for iMask = 1:length(opt.maskLabel)

        % choose the mask
        mask = fullfile(opt.maskPath, opt.maskName{iMask});
%         if strcmp(roiSource, 'freesurfer') || strcmp(roiSource, 'hmat')
%           mask = fullfile(opt.maskPath, subFolder, [opt.maskBaseName, opt.maskName{iMask}]);
%         end

        % display the used mask
        disp(opt.maskName{iMask});
        
        % 4D image
%         imageName = ['4D_', opt.mvpa.map4D{iImage}, '_', num2str(funcFWHM), '.nii'];
%         image = fullfile(ffxDir, imageName);
        imageName = ['sub-',num2str(subID),'_FoR2_4D_', opt.mvpa.map4D{iImage},'_', num2str(funcFWHM), '.nii'];
        image = fullfile('input4D',strcat('sub-',num2str(subID)),imageName);
        
        for iDecodingCondition=2%1:length(decodingConditionList) %see the types in decoing conditionlist
            decodingCondition=decodingConditionList(iDecodingCondition);
            % load cosmo input
            ds = cosmo_fmri_dataset(image, 'mask', mask);

            % Getting rid off zeros
            zeroMask = all(ds.samples == 0, 1);
            ds = cosmo_slice(ds, ~zeroMask, 2);

            % set cosmo structure
            ds = setCosmoStructure(opt, ds, condLabelNb, condLabelName);
            % slice the ds according to your targers (choose your
            % train-test conditions
            if strcmp (decodingCondition, decodingConditionList(2))==1
                    ds = cosmo_slice(ds, ds.sa.targets == condLabelNb(1) | ds.sa.targets == condLabelNb(2));
%             elseif strcmp (decodingCondition, decodingConditionList(2)) ==1
%                     ds = cosmo_slice(ds, ds.sa.targets == condLabelNb(1) | ds.sa.targets == condLabelNb(2)|);
            
            end
            
            % remove constant features
            ds = cosmo_remove_useless_data(ds);

            % calculate the mask size
            maskVoxel = size(ds.samples, 2);

            % partitioning, for test and training : cross validation
            partitions = cosmo_nfold_partitioner(ds);

            % define the voxel number for feature selection
            % set ratio to keep depending on the ROI dimension
            % if SMA, double the voxel number
    %         if strcmpi(maskLabel{iMask}, 'sma')
    %            opt.mvpa.feature_selection_ratio_to_keep = 2 * opt.mvpa.ratioToKeep;
    %         else
    %            opt.mvpa.feature_selection_ratio_to_keep = opt.mvpa.ratioToKeep;
    %         end

            % use the ratios, instead of the voxel number:
            opt.mvpa.feature_selection_ratio_to_keep = opt.mvpa.ratioToKeep;

            % ROI mvpa analysis
            [pred, accuracy] = cosmo_crossvalidate(ds, ...
                                       @cosmo_classify_meta_feature_selection, ...
                                       partitions, opt.mvpa);
        %%
%         ratios_to_keep = .05:.05:.95;
%         nratios = numel(ratios_to_keep);
% 
%         accs = zeros(nratios, 1);
% 
%         for k = 1:nratios
%           opt.mvpa.feature_selection_ratio_to_keep = ratios_to_keep(k);
% 
%           [pred, acc] = cosmo_crossvalidate(ds, ...
%                                             @cosmo_meta_feature_selection_classifier, ...
%                                             partitions, opt.mvpa);
%           accs(k) = acc;
%         end
% 
%         plot(ratios_to_keep, accs);
%         xlabel('ratio of selected feaures');
%         ylabel('classification accuracy');
% 
%         accuracy = max(accs);
%         maxRatio = ratios_to_keep(accs == max(accs));

            %% store output
            accu(count).subID = subID;
            accu(count).mask = opt.maskLabel{iMask};
            accu(count).maskVoxNb = maskVoxel;
            accu(count).choosenVoxNb = opt.mvpa.feature_selection_ratio_to_keep;
           % accu(count).choosenVoxNb = round(maskVoxel * maxRatio);
           % accu(count).maxRatio = maxRatio;
            accu(count).image = opt.mvpa.map4D{iImage};
            accu(count).ffxSmooth = funcFWHM;
            accu(count).accuracy = accuracy;
    %         accu(count).radius = opt.radius;
            accu(count).prediction = pred;
            accu(count).imagePath = image;
    %         accu(count).roiSource = roiSource;
            accu(count).decodingCondition = decodingCondition;

            %% PERMUTATION PART
            if opt.mvpa.permutate  == 1
              % number of iterations
              nbIter = 100;

              % allocate space for permuted accuracies
              acc0 = zeros(nbIter, 1);

              % make a copy of the dataset
              ds0 = ds;

              % for _niter_ iterations, reshuffle the labels and compute accuracy
              % Use the helper function cosmo_randomize_targets
              for k = 1:nbIter
                ds0.sa.targets = cosmo_randomize_targets(ds);
                [~, acc0(k)] = cosmo_crossvalidate(ds0, ...
                                                   @cosmo_meta_feature_selection_classifier, ...
                                                   partitions, opt.mvpa);
              end

              p = sum(accuracy < acc0) / nbIter;
              fprintf('%d permutations: accuracy=%.3f, p=%.4f\n', nbIter, accuracy, p);

              % save permuted accuracies
              accu(count).permutation = acc0';
            end

            % increase the counter and allons y!
            count = count + 1;

            fprintf(['Sub'  subID ' - area: ' opt.maskLabel{iMask} ...
                     ', accuracy: ' num2str(accuracy) '\n\n\n']);
        end
      end
    end
  end
  %% save output

  % mat file
  save(savefileMat, 'accu');

  % csv but with important info for plotting
%   csvAccu = rmfield(accu, 'permutation');
%   csvAccu = rmfield(csvAccu, 'prediction');
%   csvAccu = rmfield(csvAccu, 'imagePath');
%   writetable(struct2table(csvAccu), savefileCsv);

end

function ds = setCosmoStructure(opt, ds, condLabelNb, condLabelName)
  % sets up the target, chunk, labels by stimuli condition labels, runs,
  % number labels.

  % design info from opt
  nbRun = opt.mvpa.nbRun;
  betasPerCondition = opt.mvpa.nbTrialRepetition;

  % chunk (runs), target (condition), labels (condition names)
  conditionPerRun = length(condLabelNb);
  betasPerRun = betasPerCondition * conditionPerRun;

  chunks = repmat((1:nbRun)', 1, betasPerRun);
  chunks = chunks(:);

  targets = repmat(condLabelNb', 1, nbRun)';
  targets = targets(:);
  targets = repmat(targets, betasPerCondition, 1);

  condLabelName = repmat(condLabelName', 1, nbRun)';
  condLabelName = condLabelName(:);
  condLabelName = repmat(condLabelName, betasPerCondition, 1);

  % assign our 4D image design into cosmo ds git
  ds.sa.targets = targets;
  ds.sa.chunks = chunks;
  ds.sa.labels = condLabelName;

  % figure; imagesc(ds.sa.chunks);

end
