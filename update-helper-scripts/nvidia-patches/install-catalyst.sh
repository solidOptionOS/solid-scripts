mv /usr/lib64 /usr/.lib64
mv /usr/x86_64-linux-gnu /usr/.x86_64-linux-gnu
apt-get install gcc g++ make dkms fakeroot

# Download https://mega.co.nz/#!249nkZ6D!G_QanBu2lj5N3MnbHtC3kQLleV5QaSSE51iwfosnyn0

cp ~/Download/Catalyst_15.7.tar.gz ~/
tar zxvf Catalyst_15.7.tar.gz
cd Setup-Experimental
mkdir /lib/modules/4.0.0-kali1-amd64/build/include/linux
cp /usr/include/linux/version.h /lib/modules/4.0.0-kali1-amd64/build/include/linux/
sh ati-installer.sh 15.20 --install
! IMPORTANT DON'T REBOOT !
 aticonfig --initial

##############################################
Nearly there....

echo "export COGL_DRIVER=gl" >> /etc/environment
echo "export COGL_OVERRIDE_GL_VERSION=1.4" >> /etc/environment
echo "export COGL_RENDERER=GLX" >> /etc/environment
echo "export LD_PRELOAD=/usr/lib/fglrx/fglrx-libGL.so.1.2" >> /etc/environment
echo "export COGL_DRIVER=gl" > ~/.xsession
echo "export COGL_OVERRIDE_GL_VERSION=1.4" >> ~/.xsession
echo "export COGL_RENDERER=GLX" >> ~/.xsession
echo "export LD_PRELOAD=/usr/lib/fglrx/fglrx-libGL.so.1.2" >> ~/.xsession
echo "gnome-session" >> ~/.xsession
mv /usr/.lib64 /usr/lib64
mv /usr/.x86_64-linux-gnu /usr/x86_64-linux-gnu
Here's my Second most 3rd most favourite part
shutdown -r now