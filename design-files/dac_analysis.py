import csv
import matplotlib.pyplot as plt
import numpy as np

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
        for MC_run in range(1, 11):
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



#
# vgs = ['11', '12', '13']
# irefs = ['1u', '5u']
# tds = ['d', 'l', 'hl', 's']
# tnice = {'d':'default', 'l':'long', 'hl':'half-long', 's':'square'}
# data = {}
#
# for vg in vgs:
#     for iref in irefs:
#         for td in tds:
#             cname = 'vg'+vg+'ir'+iref+'t'+td
#             data[cname] = []



# vals = []
# with open('dacdata.csv') as csv_file:
#     csv_reader = csv.reader(csv_file, delimiter=',')
#     line_count = 0
#     for row in csv_reader:
#         if line_count == 0:
#             file_cnames = row
#             #print(file_cnames)
#             # print(f'Column names are {",".join(row)}')
#             line_count +=1
#         else:
#             for i in range(len(file_cnames)):
#                 #print(row[i])
#                 # data[file_cnames[i]].append(float(row[i]))
#                 if file_cnames[i] == 'i(Viout)':
#                     vals.append(float(row[0]))
#                     #print(row[0])
#             line_count += 1
#     print(f'Processed {line_count} lines.')


MC_SWITCH = True



# print(data['vg3ir1tl'])
#print(vals)
if MC_SWITCH:
    data = read_data(mode="MC")
    vals = np.zeros((10, len(data[0])))
    for row in data:
        print(len(row))
    #print(vals.shape)
    #print(len(data), len(data[0]))
    for i in range(len(vals)):
        vals[i] = np.array(data[i])
    #print(vals)
    DNLs = []
    # print(vals)
    for run in vals:
        # print(run)
        plt.plot(-1*run*1e6, '--')
        max_val = run[-1]
        lsb = max_val/127
        DNLs.append(np.ediff1d(run)/lsb - 1)
    plt.title("MC Output Characteristics")
    plt.xlabel("Input Code")
    plt.ylabel("Output Current (uA)")
    plt.figure()
    INLs = []
    for run in DNLs:
        plt.plot(run, '--')
        INLs.append(np.sum(run))
    print(INLs)
    plt.title("MC Differential Nonlinearity")
    plt.xlabel("Input Code")
    plt.ylabel("DNL (LSBs)")
    plt.show()



else:
    vals = -1*np.array(read_data())
    plt.plot(vals*1e6)
    max_val = vals[-1]
    lsb = max_val/127
    DNL = np.ediff1d(vals)/lsb - 1
    plt.title("Output Characteristics")
    plt.xlabel("Input Code")
    plt.ylabel("Output Current (uA)")
    plt.figure()
    plt.plot(DNL)
    plt.title("Differential Nonlinearity")
    plt.xlabel("Input Code")
    plt.ylabel("DNL (LSBs)")
    print(np.sum(DNL))
    plt.show()
# error_data = {}
#
# for key, vals in data.items():
#     if key!='vg14ir100ntl' and key!='vg14ir1utl' and key!='vg15ir1utl':
#         max_val = vals[-1]
#         ideal = [i*max_val/127 for i in range(128)]
#         lsb = max_val/127
#         error = np.array(vals) - np.array(ideal)
#         DNL = np.ediff1d(vals)/lsb - 1
#         # print(key+' LSB: '+ str(lsb))
#         error_data[key] = error
#         error_data[key+'_lsb'] = error/lsb
#         error_data[key+'_DNL'] = DNL
#
#
#
#
# For inspecting/comparing individual VTCs
# c1 = 'vg13ir1utl'
# # c2 = 'vg2ir100nts'
# max1 = data[c1][-1]
# lsb1 = max1/127
# # max2 = data[c2][-1]
# # lsb2 = max2/127
# plt.plot(np.array(data[c1])/lsb1, 'r')
# # plt.plot(np.array(data[c2])/lsb2, 'b')
# plt.plot([i for i in range(128)], 'g--')
# plt.figure()
# plt.plot(error_data[c1+'_DNL'], 'r:')
# # plt.plot(error_data[c2+'_DNL'], 'b:')




# plt.show()



#For showing effect of one variable
for iref in irefs:
    for td in tds:
        #Ok now graph each set of gate voltages to confirm which direction is best
        plt.figure()
        plt.title("Iref="+iref+'A, Transistor dimensions '+tnice[td]) #Current label may vary
        print("Iref="+iref+'A, Transistor dimensions '+tnice[td])
        plt.xlabel('Bit value')
        plt.ylabel('Error (LSBs)')
        #plt.ylim([-3, 4])
        for vg in vgs:
            cname = 'vg'+vg+'ir'+iref+'t'+td
            plt.plot(error_data[cname+'_lsb'], label=vg+'00 mV')
            print('For Vg of '+vg+'00 mV, INL of %f' %np.sum(error_data[cname+'_DNL']))
        plt.legend()
plt.show()
