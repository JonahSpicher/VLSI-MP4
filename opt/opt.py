import numpy as np
import scipy.optimize, os, alter_netlist
import matplotlib.pyplot as plt

"""
    .param vgval=1.8
    .param tlen=0.5
    .param twid=6
    .param ladderlen=1
    .param ladderwid=3.2
    .param isourcelen=15.5
    .param isourcewid=4
"""

def error(data):
    max_val = data[-1]
    lsb = max_val/127
    DNL = np.ediff1d(data)/lsb - 1
    # plt.plot(DNL)
    # plt.show()
    return np.sum(np.abs(DNL))

def one_step(circuit_params):
    alter_netlist.alter_params(circuit_params)

    os.system("ngspice testing.spice --batch --output==log.txt")

    data = alter_netlist.read_data()
    #print(data)
    return error(data)


def optimize():
    return scipy.optimize.minimize(one_step, [1.5, 0.5, 4, 1, 3.2, 15.5, 4], method='Nelder-Mead',
    options={'disp':True, 'maxiter':200})

res = optimize()


print(res.message)
output = res.message
res_display = "OPTIMIZATION RESULTS: \nVg: %.4f \nTlen: %.4f \nTwid: %.4f \nLadderlen: %.4f \nLadderwid: %.4f \nIsourcelen: %.4f \nIsourcewid: %.4f"%tuple(res.x)
print(res_display)
output = output + '\n' + res_display
error_disp = "Error at final point: %.8f"%res.fun
print(error_disp)
output = output + '\n' + error_disp
with open("opt_res.txt", "w") as f:
    f.write(output)
    f.close()
