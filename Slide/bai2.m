M = [1 0 0; 0 1i 1; 1i 1i+1 -3]; % Tao vecto M 3x3
V = [M M; M M]; % Tao vecto V 6x6 tu Vecto M
V(2,:) = []; % X�a h�ng 2 tu ma tran Vecto V
V(:,3) = []; % X�a cot 3 tu ma tran Vecto V
z = V(4,:); % Tao Vecto z tu h�ng 4 cua ma tran V
V(4, 2) = 1i+5; % Bien �oi gi� tri tai h�ng 4 cot 2 cua Vecto V th�nh i+5en
