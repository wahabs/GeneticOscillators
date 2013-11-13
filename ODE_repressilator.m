function dydt = ODE_repressilator(Time, y, alpha, beta, alpha0, n)
    dydt = [(alpha0 + alpha./(1.0 + y(6).^n) - y(1));
            (beta.*(y(1) - 0.19.*y(2)));
            (alpha0 + alpha./(1.0 + y(2).^n) - y(3));
            (beta.*(y(3) - y(4)));
            (alpha0 + alpha./(1.0 + y(4).^n) - y(5));
            (beta.*(y(5) - y(6)));
            ];
% This is the repressilator as related in the Elowitz 2000 paper. The
% equations above are the ordinary differential equations that were taken
% from the Purcell 2010 Review paper and its supplemental information.
%
% In these equations we have:
% alpha0 = the basal synthesis rate of the mRNA
% alpha  = the copy number of mRNA or transcription promoter strength
% beta   = the ratio of protein decay rate to mRNA decay rate
% 
% The columns of data expressed in the y matrix are
% y(1) == mRNA of TetR
% y(2) == [TetR]
% y(3) == mRNA of lambda_cl
% y(4) == [lambda_cl]
% y(5) == mRNA of LacI
% y(6) == [LacI]