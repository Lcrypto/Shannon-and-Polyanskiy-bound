
addpath("Gonzalo_lower_bound/","SP59/")
%%
clc
clear
k=20;
n=64;
R= k/n;
M=2; %modulation BPSK
snr_val = 0:0.2:4;% 
snr_val_Vazquez = 0:0.2:4; % Converse bound work if SNR>0
snr_val_Vazquez=snr_val;
show_SNR=1; % if 1 SNR else Eb/No


[FER_Sh] = Shannon_SP59(n,k,snr_val);
[FER_Go]=pc_awgn_lower_bound(n,k/n,snr_val_Vazquez);
name1 = strcat("Shannon'59 SBP ",'[',int2str(n),', ',int2str(k),']');
name2 = strcat("Gonzalo'S Converse Bound ",'[',int2str(n),', ',int2str(k),']');
%%
if show_SNR
figure

semilogy(FER_Sh(:,1),FER_Sh(:,4),"DisplayName",name1);
hold on 
semilogy(FER_Go(:,1),FER_Go(:,4),"DisplayName",name2);
xlabel("SNR(dB)");
ylabel("FER");
legend show
grid on
else
figure
semilogy(FER_Sh(:,2),FER_Sh(:,4),"DisplayName",name1);
hold on 
semilogy(FER_Go(:,2),FER_Go(:,4),"DisplayName",name2);
xlabel("$\frac{E_b}{N_0}$(dB)","Interpreter","latex");
ylabel("FER");
legend show
grid on

end
