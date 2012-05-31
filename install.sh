for filename in dotfiles/*
do
w_o_ext=`basename $filename`;
echo "Installing $filename to ~/.$w_o_ext" 
cp $filename ~/.$w_o_ext;
done
