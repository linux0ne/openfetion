#! /bin/sh

# The script is to remove all the openfetion related
# files from your system

OFETION_PATHS=$(whereis openfetion | sed 's/[^\/]*//')

for FILE in $OFETION_PATHS
do
	FILE=$(echo $FILE | grep "bin/openfetion");

	if [ x$FILE != x"" ];then
		BASE_PATH=$(echo $FILE | sed 's/\/bin\/openfetion//')

		#remove resource files
		TMP_PATH=$BASE_PATH/share/openfetion
		echo "removing $TMP_PATH"
		rm -rf $TMP_PATH

		#remove executable file
		TMP_PATH=$BASE_PATH/bin/openfetion
		echo "removing $TMP_PATH"
		rm -rf $TMP_PATH

		#remove header file
		TMP_PATH=$BASE_PATH/include/fetion*
		for INC_FILE in $TMP_PATH
		do
			echo "removing $INC_FILE"
			rm $INC_FILE
		done
		#remove library file
		TMP_PATH=$BASE_PATH/lib/libofetion*
		for LIB_FILE in $TMP_PATH
		do
			echo "removing $LIB_FILE"
			rm $LIB_FILE
		done
	fi
done

#remove desktop file
TMP_FILE=/usr/share/applications/openfetion.desktop
if [ -f $TMP_FILE ];then
	echo "removing $TMP_FILE"
	rm $TMP_FILE
fi
