
im='beta';%'t_maps', 'beta'
smooth='0';
voxNb='100';

subList={'001','002','005'};
roiList={'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'};
decodingConditionList = {'handDown_pinkyThumb_vs_handDown_fingerWrist', 'handUp_pinkyThumb_vs_handUp_fingerWrist',...
      'visual_vertical_vs_visual_horizontal'};

visDir_lhMT=[]; visDir_rhMT=[]; visDir_lS1=[]; visDir_lPC=[]; visDir_rPC=[]; visDir_lMTt=[]; visDir_rMTt=[];
handDownDir_lhMT=[]; handDownDir_rhMT=[]; handDownDir_lS1=[]; handDownDir_lPC=[]; handDownDir_rPC=[]; handDownDir_lMTt=[]; handDownDir_rMTt=[];
handUpDir_lhMT=[]; handUpDir_rhMT=[]; handUpDir_lS1=[]; handUpDir_lPC=[]; handUpDir_rPC=[]; handUpDir_lMTt=[]; handUpDir_rMTt=[];

for iAccu=1:length(accu)
    for iSub=1:length(subList)
        subID=subList(iSub);
        if strcmp(char({accu(iAccu).subID}.'),char(subID))==1

            if strcmp(char({accu(iAccu).image}.'), im)==1 && strcmp(num2str([accu(iAccu).ffxSmooth].'),smooth)==1 && strcmp(num2str([accu(iAccu).choosenVoxNb].'),voxNb)==1
                
                
                if strcmp(char({accu(iAccu).mask}.'), 'lhMT')==1
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_lhMT = [visDir_lhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_lhMT = [handDownDir_lhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_lhMT = [handUpDir_lhMT;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rhMT')==1
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_rhMT = [visDir_rhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_rhMT = [handDownDir_rhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_rhMT = [handUpDir_rhMT;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lS1')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_lS1 = [visDir_lS1;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_lS1 = [handDownDir_lS1;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_lS1 = [handUpDir_lS1;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lPC')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_lPC = [visDir_lPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_lPC = [handDownDir_lPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_lPC = [handUpDir_lPC;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rPC')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_rPC = [visDir_rPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_rPC = [handDownDir_rPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_rPC = [handUpDir_rPC;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lMTt')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_lMTt = [visDir_lMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_lMTt = [handDownDir_lMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_lMTt = [handUpDir_lMTt;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rMTt')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'visual_vertical_vs_visual_horizontal' )==1
                        visDir_rMTt = [visDir_rMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handDown_fingerWrist' )==1
                        handDownDir_rMTt = [handDownDir_rMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handUp_fingerWrist' )==1
                        handUpDir_rMTt = [handUpDir_rMTt;[accu(iAccu).accuracy].'];
                    end
                end
            end    
       end
            

    end
end

decodAccu=[visDir_lhMT,handDownDir_lhMT,handUpDir_lhMT, visDir_rhMT, handDownDir_rhMT,handUpDir_rhMT,...
    visDir_lS1, handDownDir_lS1,handUpDir_lS1, visDir_lPC, handDownDir_lPC,handUpDir_lPC, visDir_rPC, handDownDir_rPC, handUpDir_rPC...
    visDir_lMTt, handDownDir_lMTt, handUpDir_lMTt, visDir_rMTt, handDownDir_rMTt, handUpDir_rMTt ];
meanDecodAccu=mean(decodAccu);
seDecodAccu=std(decodAccu)/sqrt(length(subList));

% T = array2table(decodAccu,...
%     'VariableNames',{'visDir_lhMT','handDownDir_lhMT','handUpDir_lhMT', 'visDir_rhMT', 'handDownDir_rhMT','handUpDir_rhMT',...
%     'visDir_lS1', 'handDownDir_lS1','handUpDir_lS1', 'visDir_lPC', 'handDownDir_lPC','handUpDir_lPC', 'visDir_rPC', 'handDownDir_rPC', 'handUpDir_rPC'...
%     'visDir_lMTt', 'handDownDir_lMTt', 'handUpDir_lMTt', 'visDir_rMTt', 'handDownDir_rMTt', 'handUpDir_rMTt'});

figure(1)

model_series = [mean(visDir_lhMT),mean(handDownDir_lhMT),mean(handUpDir_lhMT); mean(visDir_rhMT), mean(handDownDir_rhMT), mean(handUpDir_rhMT);...
    mean(visDir_lS1), mean(handDownDir_lS1),mean(handUpDir_lS1); mean(visDir_lPC), mean(handDownDir_lPC),mean(handUpDir_lPC); mean(visDir_rPC), mean(handDownDir_rPC), mean(handUpDir_rPC);...
    mean(visDir_lMTt), mean(handDownDir_lMTt),mean(handUpDir_lMTt); mean(visDir_rMTt), mean(handDownDir_rMTt),mean(handUpDir_rMTt)];

model_error = [std(visDir_lhMT)/sqrt(length(subList)),std(handDownDir_lhMT)/sqrt(length(subList)),std(handUpDir_lhMT)/sqrt(length(subList));...
    std(visDir_rhMT)/sqrt(length(subList)), std(handDownDir_rhMT)/sqrt(length(subList)), std(handUpDir_rhMT)/sqrt(length(subList));...
    std(visDir_lS1)/sqrt(length(subList)), std(handDownDir_lS1)/sqrt(length(subList)),std(handUpDir_lS1)/sqrt(length(subList)); ...
    std(visDir_lPC)/sqrt(length(subList)), std(handDownDir_lPC)/sqrt(length(subList)),std(handUpDir_lPC)/sqrt(length(subList));...
    std(visDir_rPC)/sqrt(length(subList)), std(handDownDir_rPC)/sqrt(length(subList)), std(handUpDir_rPC)/sqrt(length(subList));...
    std(visDir_lMTt)/sqrt(length(subList)), std(handDownDir_lMTt)/sqrt(length(subList)),std(handUpDir_lMTt)/sqrt(length(subList));...
    std(visDir_rMTt)/sqrt(length(subList)), std(handDownDir_rMTt)/sqrt(length(subList)),std(handUpDir_rMTt)/sqrt(length(subList))];

b = bar(model_series, 'grouped'); 

% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(model_series);

% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
hold on

% Plot the errorbars
errorbar(x',model_series,model_error,'k','linestyle','none');
% 
sz=20;
scatter(repmat(x(1,1), length(visDir_lhMT), 1),visDir_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,1), length(handDownDir_lhMT), 1),handDownDir_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,1), length(handUpDir_lhMT), 1),handUpDir_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,2), length(visDir_rhMT), 1),visDir_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,2), length(handDownDir_rhMT), 1),handDownDir_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,2), length(handUpDir_rhMT), 1),handUpDir_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,3), length(visDir_lS1), 1),visDir_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,3), length(handDownDir_lS1), 1),handDownDir_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,3), length(handUpDir_lS1), 1),handUpDir_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,4), length(visDir_lPC), 1),visDir_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,4), length(handDownDir_lPC), 1),handDownDir_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,4), length(handUpDir_lPC), 1),handUpDir_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,5), length(visDir_rPC), 1),visDir_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,5), length(handDownDir_rPC), 1),handDownDir_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,5), length(handUpDir_rPC), 1),handUpDir_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,6), length(visDir_lMTt), 1),visDir_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,6), length(handDownDir_lMTt), 1),handDownDir_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,6), length(handUpDir_lMTt), 1),handUpDir_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,7), length(visDir_rMTt), 1),visDir_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,7), length(handDownDir_rMTt), 1),handDownDir_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,7), length(handUpDir_rMTt), 1),handUpDir_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');


hold on
%plot chance level
yline(0.5, '--')

hold off
ylim([0.3 0.9])
legend({'vis-VerVsHor','handDown-VerVsHor','handUp-VerVsHor'},'Location','northeastoutside')
xlabel('ROI') 
ylabel('Decoding Accuracy')
xticklabels({'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'})
head1= 'Within-HandPosture Direction Selectivity'; 
head2=strcat('image=', im,' smoothing=',smooth,' ', ' voxelNb=',voxNb);
title(head1, head2)
% saveas(gcf,strcat('decoding_', 'Within-Modality','_','image_',im,'_','smoothing',smooth,'_','voxelNb',voxNb,'.png'))