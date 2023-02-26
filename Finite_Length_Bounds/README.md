# Finite Length Converse Bounds Under AGWN Channel

This repository (fork of Linfang https://github.com/BigBluBruin/ )  gives the following converse bounds under addtive Gausian white noise (AWGN) channel:

- Shannon's 1959 Sphere Packing Bound
- Gonzela's Converse bound for power-constrained AWGN channel.

---

## How to use

The use of this function is: 

```matlab
[FER] = Shannon_SP59(n,k,snr)
[FER] = pc_awgn_lower_bound(n,rate,snr_val);
```



Input arguments: 

| Input argument |                   meaning                    |      valid value      |
| :------------: | :------------------------------------------: | :-------------------: |
|       n        |      blocklength (real-valued channel)       |    integer scalar     |
|       k        |               input bit number               |    integer scalar     |
|      rate      | transmission rate k/n [bit/real channel use] |      real scalr       |
|      SNR       |              10log10(Es/sigma2)              | real scalar or vector |



output

| output value | meaning                                                      |
| :----------: | :----------------------------------------------------------- |
|     FER      | column 1: SNR=10log10(Es/sigma2)<br />column 2: EbN0(dB)=10log10(Eb/N0)<br />column 3: EsN0(dB)=10log10(Es/N0)<br />column 4: Block (frame) error rate |

---

## Demo

Run:

```matlab
demo.m 
```

will give you the Shannon'59 SPB and Gonzalo k=64 n=128 snr=0-3dB.  



![](https://github.com/BigBluBruin/Finite_Length_Converse_Bounds/blob/main/demo.jpg?raw=true)



## References

[1] C. E. Shannon, "Probability of error for optimal codes in a Gaussian channel," in The Bell System Technical Journal, vol. 38, no. 3, pp. 611-656, May 1959, doi: 10.1002/j.1538-7305.1959.tb03905.x.

[2] G. Wiechman and I. Sason, "An Improved Sphere-Packing Bound for Finite-Length Codes Over Symmetric Memoryless Channels," in IEEE Transactions on Information Theory, vol. 54, no. 5, pp. 1962-1990, May 2008, doi: 10.1109/TIT.2008.920216.

[3] I. Sason and G. Wiechman, "Log-Domain Calculation of the 1959 Sphere-Packing Bound with Application to M-ary PSK Block Coded Modulation," *2006 IEEE 24th Convention of Electrical & Electronics Engineers in Israel*, 2006, pp. 344-348, doi: 10.1109/EEEI.2006.321097. 

[4] G. Vazquez-Vilar, "Error Probability Bounds for Gaussian Channels Under Maximal and Average Power Constraints," in IEEE Transactions on Information Theory, vol. 67, no. 6, pp. 3965-3985, June 2021, doi: 10.1109/TIT.2021.3063311.
