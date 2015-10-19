function grafica(s)

  N = length(s.padres);

  delta = 0.1;
  plot(s.coords(1,1),s.coords(1,2),'sr',s.coords(2:end,1),s.coords(2:end,2),'ob')
  xlim([min(s.coords(:,1))-0.5 max(s.coords(:,1)+0.5)]);
  ylim([min(s.coords(:,2))-0.5 max(s.coords(:,2)+0.5)]);
  hold on
  for h=2:N
  	 p = s.padres(h);
  	 text(s.coords(h,1)+delta,s.coords(h,2)+delta,sprintf('%d:%d/%d',h-1,prod(h),s.prod_acum(h)))
  	 plot([s.coords(h,1) s.coords(p,1)],[s.coords(h,2) s.coords(p,2)],'-b')
  end
  text(s.coords(1,1)+delta,s.coords(1,2)+delta,'0')
  hold off
  title('Red el�ctrica (nodo:producci�n/env�a)')
  xlabel('x')
  ylabel('y')

endfunction
