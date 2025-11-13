function plotContactArea(sheet_states,savefile,savedir,savename,savemats)
    %%%%%%%%% plotSheet %%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % % This function generates 1 summary      % %
    % % plots at the end of the simulation:    % %
    % % 1. contact area vs. time               % %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    contactarea = [];
    PIXELSIZE = 0.01
    time = 0:length(sheet_states(:,1))-1;
    
    for ss=1:length(sheet_states(:,1))
        sheet_states(ss,:)
        numzeros = sum(sheet_states(ss,:)==0);
        contactarea = [contactarea; numzeros*PIXELSIZE];
        
    end
    
    sum(abs(diff(contactarea)))/ ((contactarea(end) - contactarea(1))*mean(abs(diff(contactarea))))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % % Plot static sheet energy vs. time
    ax1 = subplot(1,1,1);
    plot(time, contactarea,'-k','LineWidth',1.5)
    hold on
    scatter(time, contactarea,'filled','k')
    xlabel("Time")
    ylabel("Contact area (num. sites)")
    pbaspect([1 1 1])

    A = gcf;
    exportgraphics(A,savedir+savename+'_contactarea.png','Resolution',300)
    close

    
    % % Save file with parameters in filename
    if savefile == true
        parameters
        filename = string(datetime('now'))+"_Ecs"+string(params.E_cs)+"_Ecc"+string(params.E_cc)+"_Acs"+string(params.a_cs)+"_"+params.case_id;
        %savefig(savedir+savename+'.fig')
        %saveas(gca,savedir+savename+'.pdf')
        A = gcf;
        exportgraphics(A,savedir+savename+'.png','Resolution',300)
        close
    end
    if savemats == true
        save(savedir+savename+"_sheet_states.mat",'sheet_states')
    end
end

