import os,re
if      __name__=="__main__":
        output = os.popen('top -n 1 |grep Cpu | cut -d "," -f 4 | cut -d " " -f 2')
        avaCpu=output.read()
        avaCpu=re.search(r'\d+',avaCpu).group()
        avaCpu = int(str(avaCpu))
        print avaCpu<20
