S_soln=-((K*rl*(abs*ae*Id*rb*(-1+es+es*ze)+Is*((-1+ae*es)*mr+re*(-1+ae-ze)+rb*(-1+ae*(1-es*ze+abs*(-1+es+es*ze))))))/((ae*Id*((es*(mr+rb)+re)*V+abs*rb*rl*(-1+es+es*ze))+Is*(mr*((-1+ae*es)*rl+ae*es*V)+re*(ae*V+rl*(-1+ae-ze))+rb*(ae*es*V+rl*(-1+ae*(1-es*ze+abs*(-1+es+es*ze))))))))
B_soln=-((ae*(es*ze + es - 1)*(Id + Is))/(-(ae*es*mr) + ae*es*rb*ze - ae*rb - ae*re + mr + rb + re*ze + re))
D_soln=-((Ku*(mr + rb + re*ze + re))/(ae*es*Vu*ze + ae*es*Vu - ae*Vu + mr + rb + re*ze + re))
E_soln=-((ae*(Id + Is)*(es*(mr + rb) + re))/(rl*(mr*(ae*es - 1) + rb*(ae*(-es)*ze + ae - 1) + re*(ae - ze - 1))))

Fu=(Vu*B_soln*D_soln)/(Ku+D_soln)
Rb= mr*B_soln
Fue=(Fu*ae*es)
Fe=re*B_soln
Re=ze*(Fe+Fue)
Ru=Fu*(1-ae)
ss_CUE= (Fu-Ru-Rb-Re-Fe-Fue)/Fu