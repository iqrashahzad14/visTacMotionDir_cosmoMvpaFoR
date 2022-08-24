function renameToBids(opt)
    
    for iSub = 1:numel(opt.subjects)

    subLabel = opt.subjects{iSub};

    printProcessingSubject(iSub, subLabel, opt)
    
    nameStructure = struct('entities', struct('sub', subLabel, ...
                                              'task', opt.taskName, ...
                                              'space', opt.space));
                                          
    bf = bids.File(nameStructure);
    bf.extension = '.nii';
    bf.entities.desc = '4D';
    bf.suffix = 'beta';
    end
    
end    
 function printProcessingSubject(iSub, subLabel)
  %
  % (C) Copyright 2019 CPP_SPM developers

  fprintf(1, [ ...
              ' PROCESSING SUBJECT No.: %i ' ...
              'SUBJECT ID : %s \n'], ...
          iSub, subLabel);

end