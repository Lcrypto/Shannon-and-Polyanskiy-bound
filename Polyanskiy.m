% Frame error rate 



    n = 1200;
    R = 1/2;
    Pev = 10.^([-0.5:-0.25:-1.75,-2:-0.5:-7]);
    uno = ones(size(Pev));

    % normal approximation 
    tic; SNRdBNA = Converse(n*uno,Pev,R*uno,'normal','error'); toc
    % O(n^-2) approximation
    tic; SNRdBPPV = Converse(n*uno,Pev,R*uno,'On2','error'); toc
    % O(n^-3) approximation
    tic; SNRdBPPVb = Converse(n*uno,Pev,R*uno,'On3','error'); toc


% display results
close all
figure(1)
set(0,'defaulttextinterpreter','latex')
semilogy(SNRdBPPV,Pev,'-',SNRdBPPVb,Pev,'--',SNRdBNA,Pev,'-.')
xlabel('SNR $E_b/N_0$')
ylabel('error probability $P_e$')
title(['n = ' num2str(n) ', R = ', num2str(R)])
legend({},'interpreter','latex')
legend('$O(n^{-2}\,)$ approx $\quad$','$O(n^{-3}\,)$ approx',...
    'normal approx','Location','Best')
grid
