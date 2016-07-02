x = 1:1:11;
y = 1:1:11;
% z = rand(78,78)*10;
z = parTable(1: 1: 121, 1);
z = reshape(z, 11, 11);

colormap hsv;
surf(x, y, z);
fvc = surf2patch(x, y, z, z,'triangles');

%CONVERT THE COLORMAP INTO A COLORMAP FOR THE VERTICES (optional if you
%want to include color)
cmap=colormap;
%getting cdata
cdata=fvc.facevertexcdata;
%normalising cdata rangle
cdata=(cdata-min(cdata));cdata=cdata/max(cdata);
%scaling by cmap range and converting to integers
cdata=round(cdata.*(size(cmap,1)-1));
%getting cdata values
cdata=cmap(cdata+1,:);
fvc2=fvc;
fvc2.vertices(:,3)=-fvc2.vertices(:,3);
x3mesh_deform(fvc.faces, fvc.vertices, fvc.vertices, 'name', 'bar3', 'color', cdata);