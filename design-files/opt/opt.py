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

def error(data, MC, fixed):
    max_val = data[-1]
    normal_lsb = max_val/127
    single_DNL = np.ediff1d(data)/normal_lsb - 1
    single_DNL_cost = np.sum(np.abs(single_DNL))

    DNLs = []
    for run in MC:
        max_val = data[-1]
        lsb = max_val/127
        DNL = np.ediff1d(data)/lsb - 1
        DNLs.append(DNL)
    mean = []
    for i in range(len(DNLs[0])):
        val = 0
        for j in range(len(DNLs)):
            val += DNLs[j][i]
        val = val/len(DNLs[j])
        mean.append(val)
    MC_DNL_cost = np.sum(np.abs(mean))

    #Next add fixed cost in
    fixed = np.array(fixed)/normal_lsb
    fixed = fixed - fixed[-1] # Set so the last value is zero
    fixed_cost = np.sum(np.abs(fixed)) #Area under this curve should be minimized



    # plt.plot(DNL)
    # plt.show()
    print("DNL: %f \nMC DNL: %f \n Variation: %f" % (single_DNL_cost, MC_DNL_cost, fixed_cost))
    return (0.5*MC_DNL_cost + single_DNL_cost) + (0.1*fixed_cost)

def one_step(circuit_params):
    alter_netlist.alter_params(circuit_params, mode="single")
    os.system("ngspice dac_harness_opt.spice --batch --output==log.txt")
    data_single = alter_netlist.read_data(mode='single')

    alter_netlist.alter_params(circuit_params, mode="MC")
    os.system("ngspice dac_harness_MC_opt.spice --batch --output==log.txt")
    data_MC = alter_netlist.read_data(mode='MC')

    alter_netlist.alter_params(circuit_params, mode="fixed")
    os.system("ngspice dac_harness_fixed_opt.spice --batch --output==log.txt")
    data_fixed = alter_netlist.read_data(mode='fixed')

    print(circuit_params)
    er = error(data_single, data_MC, data_fixed)
    # print(er)
    #print(data)
    return er


def optimize():
    return scipy.optimize.minimize(one_step, [1.5, 0.5, 4, 1, 3.2, 15.5, 4], method='Nelder-Mead',
    options={'disp':True, 'maxiter':400})



if __name__ == '__main__':
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
