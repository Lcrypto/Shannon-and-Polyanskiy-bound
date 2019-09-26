import matplotlib.pyplot as pyplot
import math
 
epsilon = 0.00001
 
def main():
    code_r = 0.5  
    fer    = 0.00001
     
    px     = [10**(ii*0.1) for ii in range( 20, 50)]
    py     = [0            for ii in range( 20, 50)]
    for ii, px_ii in enumerate(px):
        code_n = px_ii
        code_k = code_n*code_r
        theta  = find_angle(code_n, code_k)
        py[ii] = find_snr(math.log10(fer), code_n, code_r, theta)
        print "N = %f, SNR = %f" % (code_n, py[ii])
 
    # figure
    pyplot.plot(px,py, color='blue', lw=4, label='asymptotic')    
    pyplot.title("Sphere-Packing Bound for optimal code")
    pyplot.grid(True, which="both", ls='-')
    pyplot.legend( loc='upper right' )
    pyplot.xlabel("codeword size")
    pyplot.ylabel("required Eb/N0")
    pyplot.xscale("log")
##    pyplot.xticks([i*30 for i in range(0,12)])
    pyplot.yticks([-2.0+1.0*i for i in range(0,11)])
    pyplot.show()
 
# ----------------------------
#  find SNR
# ----------------------------
def find_snr(pw, code_n, code_r, theta):
    side_left  = 0.0
    side_right = 8.0
    ans        = (side_left+side_right)/2
    A          = math.sqrt(2*code_r*10**(ans/10.0)) 
    pw_est     = qfunc(code_n, theta, A)
    while abs(pw_est-pw) > abs(pw)*epsilon :
        if pw_est > pw :
            side_left  = ans    
        else :
            side_right = ans
        ans    = (side_left+side_right)/2
        A      = math.sqrt(2*code_r*10**(ans/10.0))
        pw_est = qfunc(code_n, theta, A)
    #print "snr = %f, pw = %f" % (ans, pw_est) 
    return ans
 
# ----------------------------
#  return q_func
# ----------------------------
def qfunc(code_n, theta, A):
    #print "n = %f, theta = %f, A = %f" %(code_n, theta, A)
    gv  = gfunc(theta, A)
    ans = math.log(gv*theta)
    ans = ans - (A**2-A*gv*math.sqrt(1-theta**2))/2
    ans = code_n*ans
    ans = ans - math.log(code_n*math.pi)/2
    ans = ans - math.log(1+gv**2)/2
    ans = ans - math.log(theta)
    ans = ans - math.log(A*gv*theta**2 - math.sqrt(1-theta**2))
    ans = ans / math.log(10)
    return ans
 
# ----------------------------
#  return g_func
# ----------------------------
def gfunc(theta, A):
    return (A*math.sqrt(1-theta**2)+math.sqrt( A*A*(1-theta**2)+4 ))/2
 
# ----------------------------
#  return theta
# ----------------------------
def find_angle(n,k):
    value = math.log(2*math.pi*n,2)/2 - k
    #print "n = %d, k = %d, value = %f" %(n,k,value)
 
    side_left  = 0.00001
    side_right = 1
    ans        = (side_left+side_right)/2
    cos_ans    = math.sqrt(1-ans**2)
    value_est  = (n-1)*math.log(ans,2)-math.log(cos_ans,2)
    while abs(value_est-value) > abs(value)*epsilon :
        if value_est > value :
            side_right = ans    
        else :
            side_left  = ans
        ans       = (side_left+side_right)/2
        cos_ans   = math.sqrt(1-ans**2)
        value_est = (n-1)*math.log(ans,2)-math.log(cos_ans,2)
 
    #print "value_est = %f" % value_est
    return ans
 
if __name__ == '__main__':
    main()