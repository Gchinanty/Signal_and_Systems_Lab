function varargout = drawTool(varargin)
% DRAWTOOL MATLAB code for drawTool.fig
%      DRAWTOOL, by itself, creates a new DRAWTOOL or raises the existing
%      singleton*.
%
%      H = DRAWTOOL returns the handle to a new DRAWTOOL or the handle to
%      the existing singleton*.
%
%      DRAWTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRAWTOOL.M with the given input arguments.
%
%      DRAWTOOL('Property','Value',...) creates a new DRAWTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before drawTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to drawTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help drawTool

% Last Modified by GUIDE v2.5 24-Feb-2019 14:01:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @drawTool_OpeningFcn, ...
                   'gui_OutputFcn',  @drawTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before drawTool is made visible.
function drawTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to drawTool (see VARARGIN)

% Choose default command line output for drawTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes drawTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = drawTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
welcome;


%编辑框模块
function edit1_Callback(hObject, eventdata, handles)

%接受编辑框中输入的函数字符串
global f;                
f=get(hObject,'String');


function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





%列表框模块
function listbox1_Callback(hObject, eventdata, handles)

%选项于列表框中位置与将进行的操作一一对应
val=get(hObject,'value');
switch val
    case 1
        grid on
    case 2
        grid off
    case 3
        box on
    case 4
        box off
    case 5
        axis on
    case 6
        axis off
    case 7
        axis equal
    case 8
        hold on
    otherwise
        hold off
end

function listbox1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%2D image和 3D image按钮模块
%通过这个两个单选按钮可以选择需要绘制的图像的维数
%2D image对应平面图像；3D image对应三维图像
%两个单选按钮为互斥按钮，通过代码使两个按钮无法同时点击
%定义全局变量distinguish来将用户要绘制的图像维数信息传递出去

%当输入函数框中的自变量个数与用户想要绘制的函数维数矛盾时
%会调用一个警告窗口
function radiobutton2_Callback(hObject, eventdata, handles)
global f;
count=size(symvar(sym(f)));
if count(2)>1
    Warning;
end

%互斥模块
set(handles.radiobutton2,'value',1);
set(handles.radiobutton3,'value',0);

%图像维数信息判断模块
global distinguish;
distinguish=true;



function radiobutton3_Callback(hObject, eventdata, handles)
global f;
count=size(symvar(sym(f)));
if count(2)>2
    Warning;
end
set(handles.radiobutton3,'value',1);
set(handles.radiobutton2,'value',0);
global distinguish;
distinguish=false;




% Show按钮模块
%单选按钮将用户所需要绘制图像的维数传递过来
%根据distinguish的值情况做出相应的绘制操作
function pushbutton1_Callback(hObject, eventdata, handles)
global distinguish;
global f;
axes(handles.axes1);
if distinguish
    ezplot(f);
    xlabel('x');ylabel('y');
else
    ezsurf(f);
    xlabel('x');ylabel('y');zlabel('z');
end



%坐标轴模块
% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%菜单栏模块
%文件模块
% --------------------------------------------------------------------
function Untitled_File_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%save模块
% --------------------------------------------------------------------
function Untitled_save_Callback(hObject, eventdata, handles)
[f,p]=uiputfile({'*.jpg'},'save the functional image');
str=strcat(p,f);
pix=getframe(handles.axes1);
imwrite(pix.cdata,str,'jpg')
% hObject    handle to Untitled_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%exit模块
% --------------------------------------------------------------------
function Untitled_exit_Callback(hObject, eventdata, handles)
close_system;
% hObject    handle to Untitled_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%坐标调节模块
% --------------------------------------------------------------------

function Untitled_Coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_grid_on_Callback(hObject, eventdata, handles)
grid on
% hObject    handle to Untitled_grid_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_grid_off_Callback(hObject, eventdata, handles)
grid off
% hObject    handle to Untitled_grid_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_box_on_Callback(hObject, eventdata, handles)
box on
% hObject    handle to Untitled_box_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_box_off_Callback(hObject, eventdata, handles)
box off
% hObject    handle to Untitled_box_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_axis_on_Callback(hObject, eventdata, handles)
axis on
% hObject    handle to Untitled_axis_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_axis_off_Callback(hObject, eventdata, handles)
axis off
% hObject    handle to Untitled_axis_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_axis_equal_Callback(hObject, eventdata, handles)
axis equal
% hObject    handle to Untitled_axis_equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_hold_on_Callback(hObject, eventdata, handles)
hold on
% hObject    handle to Untitled_hold_on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_hold_off_Callback(hObject, eventdata, handles)
hold off
% hObject    handle to Untitled_hold_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%颜色调节模块
% --------------------------------------------------------------------
function Untitled_Colour_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Colour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%二维图形颜色调节
% --------------------------------------------------------------------
function Untitled_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_red_Callback(hObject, eventdata, handles)
global f;
h=ezplot(f);
set(h,'Color','r');
% hObject    handle to Untitled_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_green_Callback(hObject, eventdata, handles)
global f;
h=ezplot(f);
set(h,'Color','g');
% hObject    handle to Untitled_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_blue_Callback(hObject, eventdata, handles)
global f;
h=ezplot(f);
set(h,'Color','b');
% hObject    handle to Untitled_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_bblack_Callback(hObject, eventdata, handles)
global f;
h=ezplot(f);
set(h,'Color','k');
% hObject    handle to Untitled_bblack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%三维图像颜色调节模块
% --------------------------------------------------------------------
function Untitled_3D_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------

function Untitled_autumn_Callback(hObject, eventdata, handles)
colormap(autumn);
% hObject    handle to Untitled_autumn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_cool_Callback(hObject, eventdata, handles)
colormap(cool);
% hObject    handle to Untitled_cool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_flag_Callback(hObject, eventdata, handles)
colormap(flag);
% hObject    handle to Untitled_flag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_hot_Callback(hObject, eventdata, handles)
colormap(hot);
% hObject    handle to Untitled_hot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_copper_Callback(hObject, eventdata, handles)
colormap(copper);
% hObject    handle to Untitled_copper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_jet_Callback(hObject, eventdata, handles)
colormap(jet);
% hObject    handle to Untitled_jet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_bone_Callback(hObject, eventdata, handles)
colormap(bone);
% hObject    handle to Untitled_bone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_gray_Callback(hObject, eventdata, handles)
colormap(gray);
% hObject    handle to Untitled_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_hsv_Callback(hObject, eventdata, handles)
colormap(hsv);
% hObject    handle to Untitled_hsv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_pink_Callback(hObject, eventdata, handles)
colormap(pink);
% hObject    handle to Untitled_pink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





%帮助模块
% --------------------------------------------------------------------
function Untitled_Help_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%about模块
%通过点击调用一个子窗口
% --------------------------------------------------------------------
function Untitled_about_Callback(hObject, eventdata, handles)
author;
% hObject    handle to Untitled_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%guidance模块
%通过点击调用一个指导窗口
% --------------------------------------------------------------------
function Untitled_guidance_Callback(hObject, eventdata, handles)
Guidance;
% hObject    handle to Untitled_guidance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





%自定义轴刻度范围模块
%通过定义x1,x2,y1,y2,z1,z2这六个全局变量来记录用户希望改变的轴刻度范围
function edit2_Callback(hObject, eventdata, handles)
global x1;
x1=str2double(get(hObject,'String'));
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
global x2;
x2=str2double(get(hObject,'String'));
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
global y1;
y1=str2double(get(hObject,'String'));
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
global y2;
y2=str2double(get(hObject,'String'));
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
global z1;
z1=str2double(get(hObject,'String'));
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
global z2;
z2=str2double(get(hObject,'String'));
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%运行设定的刻度按钮
%通过使用全局变量，将编辑框中的输入调整坐标轴的信息实现
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global distinguish;
global x1 x2 y1 y2 z1 z2;
if(distinguish)
    axis([x1 x2 y1 y2]);
else
    axis([x1 x2 y1 y2 z1 z2]);
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%右下角退出按钮
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close_system;
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%工具栏中的保存按钮
%与菜单栏中的文件保存的作用一样
% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
[f,p]=uiputfile({'*.jpg'},'save the functional image');
str=strcat(p,f);
pix=getframe(handles.axes1);
imwrite(pix.cdata,str,'jpg')
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ID_Callback(hObject, eventdata, handles)
% hObject    handle to ID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
released_ID;
