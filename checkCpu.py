import os,re
if __name__=="__main__":
        output = os.popen('top -n 1 |grep Cpu | cut -d "," -f 4 | cut -d " " -f 2')
        avaCpu=output.read()
        avaCpu=re.search(r'\d+',avaCpu).group()
        avaCpu = int(str(avaCpu))
        if avaCpu<30 :
                print 'Cpu'
        else :
                output = os.popen('top -n 1 |grep Task | cut -d "," -f 3 | cut -d " " -f 2')
                sleepTask=output.read()
                sleepTask=re.search(r'\d+',sleepTask).group()
                sleepTask = int(str(sleepTask))
                if sleepTask<500 :
                        print 'Normal'
                else:
                        print 'Tasks'
