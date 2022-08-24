function maskVoxel = calculateMaskSize(opt)

% get the smoothing parameter for 4D map
  funcFWHM = opt.funcFWHM;
    
  %% MVPA options

  % set cosmo mvpa structure
  condLabelNb = [1 2 3 4 5 6 ];
  condLabelName = {'handDown_pinkyThumb', 'handDown_fingerWrist', 'handUp_pinkyThumb', 'handUp_fingerWrist', 'visual_vertical', 'visual_horizontal'};
  decodingConditionList = {'handUp_pinkyThumb_vs_handDown_pinkyThumb', 'handDown_fingerWrist_vs_handUp_fingerWrist',...
      'handUp_pinkyThumb_vs_handDown_fingerWrist', 'handDown_pinkyThumb_vs_handUp_fingerWrist',};%ext,anat,

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

      for iMask = 1:length(opt.maskName)

        % choose the mask
        mask = fullfile(opt.maskPath, opt.maskName{iMask});

        % display the used mask
        disp(opt.maskName{iMask});
        
        % 4D image
        imageName = ['sub-',num2str(subID),'_FoR2_4D_', opt.mvpa.map4D{iImage},'_', num2str(funcFWHM), '.nii'];
        image = fullfile('input4D',imageName);

        % load cosmo input
        ds = cosmo_fmri_dataset(image, 'mask', mask);

        % Getting rid off zeros
        zeroMask = all(ds.samples == 0, 1);
        ds = cosmo_slice(ds, ~zeroMask, 2);

        % set cosmo structure
        ds = setCosmoStructure(opt, ds, condLabelNb, condLabelName);

        % slice the ds according to your targers (choose your
        % train-test conditions
%         ds = cosmo_slice(ds, ds.sa.targets == 1 | ds.sa.targets == 2);%%??

        % remove constant features
%         ds = cosmo_remove_useless_data(ds);

        % calculate the mask size
        maskVoxel = size(ds.samples, 2);
        % display the mask size
        disp(maskVoxel);
      end

        % increase the counter and allons y!
        count = count + 1;
    end
   
  end

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
