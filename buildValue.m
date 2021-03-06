% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation, version 2.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software Foundation,
% Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Builds the matrix of the values of the    %
%              projected points               %
%                                             %
%   Created : 2005                            %
%    Author : Christopher Mei                 %
%                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function sfxp1 = buildValue(n_ima, gridInfo, param, ind_active) %get the value of F(x), the error of the reprojection.

sfxp1=[];

for kk = ind_active
  x = omniCamProjection(gridInfo.X{kk},...
			[param(11+7*(kk-1)+1 : 11+7*(kk-1)+7);param(1:11)]);
  
  exkk = x-gridInfo.x{kk};
  [nlines,ncols]=size(exkk);
  exkk = reshape(exkk,ncols*nlines,1);
  
  sfxp1=[sfxp1;exkk];
end
