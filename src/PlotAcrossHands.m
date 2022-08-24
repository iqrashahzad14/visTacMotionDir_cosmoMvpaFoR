
im='beta';%'t_maps', 'beta'
smooth='0';
voxNb='100';

subList={'001','002'};
roiList={'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'};
decodingConditionList = {'handUp_pinkyThumb_vs_handDown_pinkyThumb', 'handDown_fingerWrist_vs_handUp_fingerWrist',...
    'handUp_pinkyThumb_vs_handDown_fingerWrist', 'handDown_pinkyThumb_vs_handUp_fingerWrist'};%ext then anat


extA_lhMT=[]; extA_rhMT=[]; extA_lS1=[]; extA_lPC=[]; extA_rPC=[]; extA_lMTt=[]; extA_rMTt=[];
extB_lhMT=[]; extB_rhMT=[]; extB_lS1=[]; extB_lPC=[]; extB_rPC=[]; extB_lMTt=[]; extB_rMTt=[];
anatA_lhMT=[]; anatA_rhMT=[]; anatA_lS1=[]; anatA_lPC=[]; anatA_rPC=[]; anatA_lMTt=[]; anatA_rMTt=[];
anatB_lhMT=[]; anatB_rhMT=[]; anatB_lS1=[]; anatB_lPC=[]; anatB_rPC=[]; anatB_lMTt=[]; anatB_rMTt=[];

for iAccu=1:length(accu)
    for iSub=1:length(subList)
        subID=subList(iSub);
        if strcmp(char({accu(iAccu).subID}.'),char(subID))==1

            if strcmp(char({accu(iAccu).image}.'), im)==1 && strcmp(num2str([accu(iAccu).ffxSmooth].'),smooth)==1 && strcmp(num2str([accu(iAccu).choosenVoxNb].'),voxNb)==1
                
                
                if strcmp(char({accu(iAccu).mask}.'), 'lhMT')==1
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_lhMT = [extA_lhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_lhMT = [extB_lhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_lhMT = [anatA_lhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_lhMT = [anatB_lhMT;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rhMT')==1
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_rhMT = [extA_rhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_rhMT = [extB_rhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_rhMT = [anatA_rhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_rhMT = [anatB_rhMT;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lS1')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_lS1 = [extA_lS1;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_lS1 = [extB_lS1;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_lS1 = [anatA_lS1;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_lS1 = [anatB_lS1;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lPC')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_lPC = [extA_lPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_lPC = [extB_lPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_lPC = [anatA_lPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_lPC = [anatB_lPC;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rPC')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_rPC = [extA_rPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_rPC = [extB_rPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_rPC = [anatA_rPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_rPC = [anatB_rPC;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lMTt')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_lMTt = [extA_lMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_lMTt = [extB_lMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_lMTt = [anatA_lMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_lMTt = [anatB_lMTt;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rMTt')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_pinkyThumb' )==1
                        extA_rMTt = [extA_rMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_fingerWrist_vs_handUp_fingerWrist' )==1
                        extB_rMTt = [extB_rMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handUp_pinkyThumb_vs_handDown_fingerWrist' )==1
                        anatA_rMTt = [anatA_rMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'handDown_pinkyThumb_vs_handUp_fingerWrist' )==1
                        anatB_rMTt = [anatB_rMTt;[accu(iAccu).accuracy].'];
                    end
                end
            end    
       end
            

    end
end

decodAccu=[extA_lhMT,extB_lhMT,anatA_lhMT, anatB_lhMT, extA_rhMT, extB_rhMT,anatA_rhMT, anatB_rhMT,...
    extA_lS1, extB_lS1,anatA_lS1, anatB_lS1, extA_lPC, extB_lPC,anatA_lPC, anatB_lPC, extA_rPC, extB_rPC, anatA_rPC, anatB_rPC,...
    extA_lMTt, extB_lMTt, anatA_lMTt, anatB_lMTt, extA_rMTt, extB_rMTt, anatA_rMTt, anatB_rMTt ];
meanDecodAccu=mean(decodAccu);
seDecodAccu=std(decodAccu)/sqrt(length(subList));

T = array2table(decodAccu,...
    'VariableNames',{'extA_lhMT','extB_lhMT','anatA_lhMT', 'anatB_lhMT', 'extA_rhMT', 'extB_rhMT','anatA_rhMT', 'anatB_rhMT',...
    'extA_lS1', 'extB_lS1','anatA_lS1', 'anatB_lS1', 'extA_lPC', 'extB_lPC','anatA_lPC', 'anatB_lPC', 'extA_rPC', 'extB_rPC', 'anatA_rPC', 'anatB_rPC',...
    'extA_lMTt', 'extB_lMTt', 'anatA_lMTt', 'anatB_lMTt', 'extA_rMTt', 'extB_rMTt', 'anatA_rMTt', 'anatB_rMTt'});

%%
figure(1)


model_series = [mean(extA_lhMT),mean(extB_lhMT),mean(anatA_lhMT),mean(anatB_lhMT);...
    mean(extA_rhMT), mean(extB_rhMT), mean(anatA_rhMT), mean(anatB_rhMT);...
    mean(extA_lS1), mean(extB_lS1),mean(anatA_lS1),mean(anatB_lS1);...
    mean(extA_lPC), mean(extB_lPC),mean(anatA_lPC), mean(anatB_lPC);...
    mean(extA_rPC), mean(extB_rPC), mean(anatA_rPC), mean(anatB_rPC);...
    mean(extA_lMTt), mean(extB_lMTt),mean(anatA_lMTt), mean(anatB_lMTt); ...
    mean(extA_rMTt), mean(extB_rMTt),mean(anatA_rMTt), mean(anatB_rMTt)];

model_error = [std(extA_lhMT)/sqrt(length(subList)),std(extB_lhMT)/sqrt(length(subList)), std(anatA_lhMT)/sqrt(length(subList)), std(anatB_lhMT)/sqrt(length(subList));...
    std(extA_rhMT)/sqrt(length(subList)),std(extB_rhMT)/sqrt(length(subList)), std(anatA_rhMT)/sqrt(length(subList)), std(anatB_rhMT)/sqrt(length(subList));...
    std(extA_lS1)/sqrt(length(subList)),std(extB_lS1)/sqrt(length(subList)), std(anatA_lS1)/sqrt(length(subList)), std(anatB_lS1)/sqrt(length(subList));...
    std(extA_lPC)/sqrt(length(subList)),std(extB_lPC)/sqrt(length(subList)), std(anatA_lPC)/sqrt(length(subList)), std(anatB_lPC)/sqrt(length(subList));...
    std(extA_rPC)/sqrt(length(subList)),std(extB_rPC)/sqrt(length(subList)), std(anatA_rPC)/sqrt(length(subList)), std(anatB_rPC)/sqrt(length(subList));...
    std(extA_lMTt)/sqrt(length(subList)),std(extB_lMTt)/sqrt(length(subList)), std(anatA_lMTt)/sqrt(length(subList)), std(anatB_lMTt)/sqrt(length(subList));...
    std(extA_rMTt)/sqrt(length(subList)),std(extB_rMTt)/sqrt(length(subList)), std(anatA_rMTt)/sqrt(length(subList)), std(anatB_rMTt)/sqrt(length(subList))];

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
scatter(repmat(x(1,1), length(extA_lhMT), 1),extA_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,1), length(extB_lhMT), 1),extB_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,1), length(anatA_lhMT), 1),anatA_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,1), length(anatB_lhMT), 1),anatB_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,2), length(extA_rhMT), 1),extA_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,2), length(extB_rhMT), 1),extB_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,2), length(anatA_rhMT), 1),anatA_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,2), length(anatB_rhMT), 1),anatB_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,3), length(extA_lS1), 1),extA_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,3), length(extB_lS1), 1),extB_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,3), length(anatA_lS1), 1),anatA_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,3), length(anatB_lS1), 1),anatB_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,4), length(extA_lPC), 1),extA_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,4), length(extB_lPC), 1),extB_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,4), length(anatA_lPC), 1),anatA_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,4), length(anatB_lPC), 1),anatB_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,5), length(extA_rPC), 1),extA_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,5), length(extB_rPC), 1),extB_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,5), length(anatA_rPC), 1),anatA_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,5), length(anatB_rPC), 1),anatB_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,6), length(extA_lMTt), 1),extA_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,6), length(extB_lMTt), 1),extB_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,6), length(anatA_lMTt), 1),anatA_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,6), length(anatB_lMTt), 1),anatB_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,7), length(extA_rMTt), 1),extA_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,7), length(extB_rMTt), 1),extB_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(3,7), length(anatA_rMTt), 1),anatA_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(4,7), length(anatB_rMTt), 1),anatB_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

hold on
%plot chance level
yline(0.5, '--')

hold off
ylim([0 1])
legend({'handUp-pinkyThumb-vs-handDown-pinkyThumb', 'handDown-fingerWrist-vs-handUp-fingerWrist',...
    'handUp-pinkyThumb-vs-handDown-fingerWrist', 'handDown-pinkyThumb-vs-handUp-fingerWrist'},'Location','northeastoutside')
% legend({'ExtA', 'ExtB','AnatA', 'AnatB'},'Location','northeastoutside')
% legend(decodingConditionList,'Location','northeastoutside')
xlabel('ROI') 
ylabel('Decoding Accuracy')
xticklabels({'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'})
head1= 'Across Hand Posture'; 
head2=strcat('image=', im,' smoothing=',smooth,' ', ' voxelNb=',voxNb);
title(head1, head2)
% saveas(gcf,strcat('decoding_', 'Within-Modality','_','image_',im,'_','smoothing',smooth,'_','voxelNb',voxNb,'.png'))

%%
% figure(2)
% 
% model_series = [mean([extA_lhMT;extB_lhMT]),mean([anatA_lhMT;anatB_lhMT]); mean([extA_rhMT;extB_rhMT]), mean([anatA_rhMT;anatB_rhMT]);...
%     mean([extA_lS1;extB_lS1]),mean([anatA_lS1;anatB_lS1]); mean([extA_lPC;extB_lPC]),mean([anatA_lPC;anatB_lPC]); mean([extA_rPC;extB_rPC]), mean([anatA_rPC;anatB_rPC]);...
%     mean([extA_lMTt;extB_lMTt]),mean([anatA_lMTt;anatB_lMTt]); mean([extA_rMTt;extB_rMTt]),mean([anatA_rMTt;anatB_rMTt])];
% 
% % model_error = [std([extA_lhMT;extB_lhMT]),std([anatA_lhMT;anatB_lhMT]); std([extA_rhMT;extB_rhMT]), std([anatA_rhMT;anatB_rhMT]);...
% %     std([extA_lS1;extB_lS1]),std([anatA_lS1;anatB_lS1]); std([extA_lPC;extB_lPC]),std([anatA_lPC;anatB_lPC]); std([extA_rPC;extB_rPC]), std([anatA_rPC;anatB_rPC]);...
% %     std([extA_lMTt;extB_lMTt]),std([anatA_lMTt;anatB_lMTt]); std([extA_rMTt;extB_rMTt]),std([anatA_rMTt;anatB_rMTt])];
% 
% b = bar(model_series, 'grouped'); 
% 
% % Calculate the number of groups and number of bars in each group
% [ngroups,nbars] = size(model_series);
% 
% % Get the x coordinate of the bars
% x = nan(nbars, ngroups);
% for i = 1:nbars
%     x(i,:) = b(i).XEndPoints;
% end
% hold on
% 
% % Plot the errorbars
% % errorbar(x',model_series,model_error,'k','linestyle','none');
% 
% hold on
% %plot chance level
% yline(0.5, '--')
% 
% hold off
% ylim([0 1])
% legend({'handUp-pinkyThumb-vs-handDown-pinkyThumb & handDown-fingerWrist-vs-handUp-fingerWrist',...
%     'handUp-pinkyThumb-vs-handDown-fingerWrist & handDown-pinkyThumb-vs-handUp-fingerWrist'},'Location','northeastoutside')
% % legend({'Ext','Anat'},'Location','northeastoutside')
% xlabel('ROI') 
% ylabel('Decoding Accuracy')
% xticklabels({'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'})
% head1= 'Across Hand Posture'; 
% head2=strcat('image=', im,' smoothing=',smooth,' ', ' voxelNb=',voxNb);
% title(head1, head2)
% % saveas(gcf,strcat('decoding_', 'Within-Modality','_','image_',im,'_','smoothing',smooth,'_','voxelNb',voxNb,'.png'))