%here we convert the data array into data matrix with 57 rows and 8 columns
%from here data will get read from column to column
function m=interleaver(conv_output)
k=0;
for i=1:8
    for j=1:57
    k=k+1;
    m(i,j)=conv_output(k);
    end
end
end