function grafica(padre, prod, C, prod_acum)

  N = length(padre);

  delta = 0.1;
  plot(C(1,1),C(1,2),'sr',C(2:end,1),C(2:end,2),'ob')
  xlim([min(C(:,1))-0.5 max(C(:,1)+0.5)]);
  ylim([min(C(:,2))-0.5 max(C(:,2)+0.5)]);
  hold on
  for h=2:N
  	 p = padre(h);
  	 text(C(h,1)+delta,C(h,2)+delta,sprintf('%d:%d/%d',h-1,prod(h),prod_acum(h)))
  	 plot([C(h,1) C(p,1)],[C(h,2) C(p,2)],'-b')
  end
  text(C(1,1)+delta,C(1,2)+delta,'0')
  hold off
  title('Red el�ctrica (nodo:producci�n/env�a)')
  xlabel('x')
  ylabel('y')

endfunction
