

def read_data(fname="dacdata", mode="single"):
    if mode == "single":
        with open(fname+'.txt') as f:
            text = f.read()

        data_all = text.split()
        data_str = [data_all[1+2*i] for i in range(len(data_all)//2)]
        data_str = data_str[1:]
        data = [float(x) for x in data_str]
        return data
    elif mode == "MC":
        MC_data = []
        for MC_run in range(1, 6):
            with open(fname+'MC'+str(MC_run)+'.txt') as f:
                text = f.read()

            data_all = text.split()
            data_str = [data_all[1+2*i] for i in range(len(data_all)//2)]
            data_str = data_str[1:]
            data = [float(x) for x in data_str]
            # print(data)
            MC_data.append(data)
        #print(MC_data)
        return MC_data
    elif mode == "fixed":
        with open(fname+'_fixed.txt') as f:
            text = f.read()

        data_all = text.split()
        data_str = [data_all[1+2*i] for i in range(len(data_all)//2)]
        data_str = data_str[1:]
        data = [float(x) for x in data_str]
        return data


def alter_params(circuit_parameters, mode="single"):
    """
    Original values:
    .param llen=1.4
    .param lwid=5.7
    .param blen=0.5
    .param bwid=1.4
    .param brlen=0.3
    .param brwid=3.15
    .param Rbias=250
    """
    if mode=="single":
        fname = "dac_harness_opt.spice"
    elif mode == "MC":
        fname = "dac_harness_MC_opt.spice"
    elif mode == "fixed":
        fname = "dac_harness_fixed_opt.spice"


    with open(fname) as f:
        text = f.read()

    #print(text[0:25])
    for i in range(len(text)):
        if text[i:i+8] == '.param l':
            start_point = i
            break

    num_newlines = 0
    for i in range(start_point, len(text)):
        if text[i] == '\n':
            num_newlines += 1
        if num_newlines == 7:
            end_point = i
            break

    old_params = text[start_point:end_point].split('\n')
    new_params = []
    for i in range(len(old_params)):
        param = old_params[i]
        for j in range(len(param)):
            if param[j] == '=':
                nps = param[:j+1]
                break

        nps = nps+str(circuit_parameters[i])
        new_params.append(nps)
    new_pblock = '\n'.join(new_params)
    #print(new_pblock)


    new_file = text[0:start_point] + new_pblock + text[end_point:]
    with open(fname, "w") as f:
        f.write(new_file)




#alter_params((1.5, 0.1, 6, 1, 1, 1, 1))
