function data = rawb_transform(filename)
fid = fopen(filename);
temp= fread(fid, 181 * 217 * 181);
data=reshape(temp,181,217,181);
% temp= fread(fid, 256 * 256 * 256);
% data=reshape(temp,256,256,256);
