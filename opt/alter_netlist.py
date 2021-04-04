

def read_data(fname="dacdata.txt"):
    with open(fname) as f:
        text = f.read()

    data_all = text.split()
    data_str = [data_all[1+2*i] for i in range(len(data_all)//2)]
    data_str = data_str[1:]
    data = [float(x) for x in data_str]
    return data


def alter_params(circuit_parameters):
    """
    iref, vg, tlen, twid, ladderlen, ladderwid = circuit_parameters
    Original values:
    .param vgval=1.8
    .param tlen=0.5
    .param twid=6
    .param ladderlen=1
    .param ladderwid=3.2
    .param isourcelen=15.5
    .param isourcewid=4
    """

    with open("testing.spice") as f:
        text = f.read()

    #print(text[0:25])
    for i in range(len(text)):
        if text[i:i+8] == '.param v':
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
    with open("testing.spice", "w") as f:
        f.write(new_file)


#alter_params((1.5, 0.1, 6, 1, 1, 1, 1))
