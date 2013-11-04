function contour_plot(x, y, OSCDETECT)
    figure(1);clf
    contourf(x,y,OSCDETECT, [1, 0])
    colormap default
    xlabel('\tau_y');ylabel('\sigma')
