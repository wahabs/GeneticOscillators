% This is the repressilator as related in the Elowitz 2000 paper. The
% equations above are the ordinary differential equations that were taken
% from the Purcell 2010 Review paper and its supplemental information.
%
% In these equations we have:
% alpha0 = the basal synthesis rate of the mRNA
% alpha  = the copy number of mRNA or transcription promoter strength
% beta   = the ratio of protein decay rate to mRNA decay rate
% 
% The columns of data expressed in the y0 matrix are
% y0(1) == mRNA of TetR
% y0(2) == [TetR]
% y0(3) == mRNA of lambda_cl
% y0(4) == [lambda_cl]
% y0(5) == mRNA of LacI
% y0(6) == [LacI]

function dydt = ODE_repressilator_mod(Time, y0, alpha, beta, alpha0, n, delta_max, D, D_half)

    delta = 1 - (delta_max - 1)./(1 + exp(D_half)) + (delta_max - 1)./(1 + exp(-(D-D_half)));

    dydt = [(alpha0 + alpha./(1.0 + y0(6).^n) - y0(1));
            (beta*delta.*(y0(1) - 0.19.*y0(2)));
            (alpha0 + alpha./(1.0 + y0(2).^n) - y0(3));
            (beta*delta.*(y0(3) - y0(4)));
            (alpha0 + alpha./(1.0 + y0(4).^n) - y0(5));
            (beta*delta.*(y0(5) - y0(6)));
            ];
