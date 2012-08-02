cd /home/dylix/.minecraft/Server
mount /home/dylix/.minecraft/Server/plutonic
cp -R ./backup/* ./plutonic/
java -Xmx2G -Xms2G -jar minecraft_server.jar nogui
#java -Xmx2G -Xms2G -jar craftbukkit-1.2.3-R0.1.jar

rm -r ./backup/*
mv ./plutonic/* ./backup/
umount /home/dylix/.minecraft/Server/plutonic

#./server.sh
#java -Xmx512M -Xms512M -cp bin/MinecraftSP.jar net.minecraft.LauncherFrame
