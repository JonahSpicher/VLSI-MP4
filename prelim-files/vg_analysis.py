import csv
import matplotlib.pyplot as plt
import numpy as np


vgs = ['11', '12', '13']
irefs = ['1u', '5u']
tds = ['d', 'l', 'hl', 's']
tnice = {'d':'default', 'l':'long', 'hl':'half-long', 's':'square'}
data = {}

for vg in vgs:
    for iref in irefs:
        for td in tds:
            cname = 'vg'+vg+'ir'+iref+'t'+td
            data[cname] = []



vals = []
with open('dacdata.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            file_cnames = row
            #print(file_cnames)
            # print(f'Column names are {",".join(row)}')
            line_count +=1
        else:
            for i in range(len(file_cnames)):
                #print(row[i])
                # data[file_cnames[i]].append(float(row[i]))
                if file_cnames[i] == 'i(Viout)':
                    vals.append(float(row[0]))
                    #print(row[0])
            line_count += 1
    print(f'Processed {line_count} lines.')

# print(data['vg3ir1tl'])
#print(vals)
plt.plot(vals)
max_val = vals[-1]
lsb = max_val/127
DNL = np.ediff1d(vals)/lsb - 1
plt.figure()
plt.plot(DNL)
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
