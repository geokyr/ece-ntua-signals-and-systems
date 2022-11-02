% Step-impulse simulating function
% Input: The b,a coefficients of the system
% Duration of simulation, N (in samples)

function stepz(b,a,N)
  
  u = ones(1,N);
  y = filter(b,a,u);
  
  figure
  stem(y)
  hold on
  title('Step response')
  xlabel('Time(samples)')
  ylabel('Amplitude')
 end
