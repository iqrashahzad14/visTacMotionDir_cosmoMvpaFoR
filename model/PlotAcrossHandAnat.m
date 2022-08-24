
im='beta';%'t_maps', 'beta'
smooth='0';
voxNb='100';

subList={'001','002','005'};
roiList={'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'};
decodingConditionList = {'HDPT_HUPT_vs_HDFW_HUFW','HUPT_HDFW_vs_HDPT_HUFW'};

anat_lhMT=[]; anat_rhMT=[]; anat_lS1=[]; anat_lPC=[]; anat_rPC=[]; anat_lMTt=[]; anat_rMTt=[];
ext_lhMT=[]; ext_rhMT=[]; ext_lS1=[]; ext_lPC=[]; ext_rPC=[]; ext_lMTt=[]; ext_rMTt=[];


for iAccu=1:length(accu)
    for iSub=1:length(subList)
        subID=subList(iSub);
        if strcmp(char({accu(iAccu).subID}.'),char(subID))==1

            if strcmp(char({accu(iAccu).image}.'), im)==1 && strcmp(num2str([accu(iAccu).ffxSmooth].'),smooth)==1 && strcmp(num2str([accu(iAccu).choosenVoxNb].'),voxNb)==1
                
                
                if strcmp(char({accu(iAccu).mask}.'), 'lhMT')==1
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_lhMT = [anat_lhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_lhMT = [ext_lhMT;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rhMT')==1
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_rhMT = [anat_rhMT;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_rhMT = [ext_rhMT;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lS1')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_lS1 = [anat_lS1;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_lS1 = [ext_lS1;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lPC')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_lPC = [anat_lPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_lPC = [ext_lPC;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rPC')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_rPC = [anat_rPC;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_rPC = [ext_rPC;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'lMTt')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_lMTt = [anat_lMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_lMTt = [ext_lMTt;[accu(iAccu).accuracy].'];
                    end
                end
                
                if strcmp(char({accu(iAccu).mask}.'), 'rMTt')==1 
                    varDecodCond={accu(iAccu).decodingCondition}.';
                    if strcmp(varDecodCond{1}{1},'HDPT_HUPT_vs_HDFW_HUFW' )==1
                        anat_rMTt = [anat_rMTt;[accu(iAccu).accuracy].'];
                    elseif strcmp(varDecodCond{1}{1},'HUPT_HDFW_vs_HDPT_HUFW' )==1
                        ext_rMTt = [ext_rMTt;[accu(iAccu).accuracy].'];
                    end
                end
            end    
       end
            

    end
end

decodAccu=[anat_lhMT, anat_rhMT, anat_lS1, anat_lPC, anat_rPC, anat_lMTt, anat_rMTt,...
ext_lhMT, ext_rhMT, ext_lS1, ext_lPC, ext_rPC, ext_lMTt, ext_rMTt ];
% meanDecodAccu=mean(decodAccu);
% seDecodAccu=std(decodAccu)/sqrt(length(subList));

T = array2table(decodAccu,...
    'VariableNames',{'anat_lhMT', 'anat_rhMT', 'anat_lS1', 'anat_lPC', 'anat_rPC', 'anat_lMTt', 'anat_rMTt',...
'ext_lhMT', 'ext_rhMT', 'ext_lS1', 'ext_lPC', 'ext_rPC', 'ext_lMTt', 'ext_rMTt' });

%%
figure(1)


model_series = [mean(anat_lhMT),mean(ext_lhMT);...
    mean(anat_rhMT), mean(ext_rhMT);...
    mean(anat_lS1), mean(ext_lS1);...
    mean(anat_lPC), mean(ext_lPC);...
    mean(anat_rPC), mean(ext_rPC);...
    mean(anat_lMTt), mean(ext_lMTt); ...
    mean(anat_rMTt), mean(ext_rMTt)];

model_error = [std(anat_lhMT)/sqrt(length(subList)),std(ext_lhMT)/sqrt(length(subList));...
    std(anat_rhMT)/sqrt(length(subList)),std(ext_rhMT)/sqrt(length(subList));...
    std(anat_lS1)/sqrt(length(subList)),std(ext_lS1)/sqrt(length(subList));...
    std(anat_lPC)/sqrt(length(subList)),std(ext_lPC)/sqrt(length(subList));...
    std(anat_rPC)/sqrt(length(subList)),std(ext_rPC)/sqrt(length(subList));...
    std(anat_lMTt)/sqrt(length(subList)),std(ext_lMTt)/sqrt(length(subList));...
    std(anat_rMTt)/sqrt(length(subList)),std(ext_rMTt)/sqrt(length(subList))];

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
scatter(repmat(x(1,1), length(anat_lhMT), 1),anat_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,1), length(ext_lhMT), 1),ext_lhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,2), length(anat_rhMT), 1),anat_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,2), length(ext_rhMT), 1),ext_rhMT,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,3), length(anat_lS1), 1),anat_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,3), length(ext_lS1), 1),ext_lS1,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');


scatter(repmat(x(1,4), length(anat_lPC), 1),anat_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,4), length(ext_lPC), 1),ext_lPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

scatter(repmat(x(1,5), length(anat_rPC), 1),anat_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,5), length(ext_rPC), 1),ext_rPC,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');


scatter(repmat(x(1,6), length(anat_lMTt), 1),anat_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,6), length(ext_lMTt), 1),ext_lMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');


scatter(repmat(x(1,7), length(anat_rMTt), 1),anat_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');
scatter(repmat(x(2,7), length(ext_rMTt), 1),ext_rMTt,sz,'MarkerEdgeColor','k','MarkerFaceColor','k');

hold on
%plot chance level
yline(0.5, '--')

hold off

ylim([0 1])
legend({'anat-HDPT-HUPT-vs-HDFW-HUFW','ext-HUPT-HDFW-vs-HDPT-HUFW'},'Location','northeastoutside')
xlabel('ROI') 
ylabel('Decoding Accuracy')
xticklabels({'lhMT','rhMT','lS1','lPC', 'rPC', 'lMTt', 'rMTt'})
head1= 'Across Hand Posture'; 
head2=strcat('image=', im,' smoothing=',smooth,' ', ' voxelNb=',voxNb);
title(head1, head2)
% saveas(gcf,strcat('decoding_', 'Within-Modality','_','image_',im,'_','smoothing',smooth,'_','voxelNb',voxNb,'.png'))


%%
shape='o';

%%set the width of the edge of the markers
LineWidthMarkers=1.5;
%%set the width of the edge of the mean line
LineWidthMean=4;
%%set the length of the mean line
LineLength=0.4; %the actual length will be the double of this value

%%%set the color for each condition in RGB (and divide them by 256 to be matlab compatible)
Col_A=[105 170 153]/256; %
Col_B=[24 96 88]/256;%
Col_C=[255 158 74]/256; %
Col_D=[208 110 48]/256;%
Col_E=[198 131 239]/256;%
Col_F=[121 57 195]/256; %

Colors=[Col_A;Col_B;Col_C;Col_D;Col_E;Col_F];

%%%set the transparency of the markers
Transparency=1;%0.7;

FontName='Avenir'; %set the style of the labels
FontSize=17; %%set the size of the labels

set(gcf,'color','w');

ax=gca;

set(ax,'FontName',FontName,'FontSize',FontSize, 'FontWeight','bold',...
    'LineWidth',2.5,'TickDir','out', 'TickLength', [0,0],...
    'FontSize',FontSize);
box off
% saveas(gcf,strcat('sub002','decoding_', 'Within-Modality','_','image_',im,'_','smoothing',smooth,'_','voxelNb',voxNb,'.png'))
