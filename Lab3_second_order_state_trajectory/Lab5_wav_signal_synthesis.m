
function varargout = Lab5_wav_signal_synthesis(varargin)
% LAB5_WAV_SIGNAL_SYNTHESIS MATLAB code for Lab5_wav_signal_synthesis.fig
%      LAB5_WAV_SIGNAL_SYNTHESIS, by itself, creates a new LAB5_WAV_SIGNAL_SYNTHESIS or raises the existing
%      singleton*.
%
%      H = LAB5_WAV_SIGNAL_SYNTHESIS returns the handle to a new LAB5_WAV_SIGNAL_SYNTHESIS or the handle to
%      the existing singleton*.
%
%      LAB5_WAV_SIGNAL_SYNTHESIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB5_WAV_SIGNAL_SYNTHESIS.M with the given input arguments.
%
%      LAB5_WAV_SIGNAL_SYNTHESIS('Property','Value',...) creates a new LAB5_WAV_SIGNAL_SYNTHESIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lab5_wav_signal_synthesis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lab5_wav_signal_synthesis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lab5_wav_signal_synthesis

% Last Modified by GUIDE v2.5 04-Sep-2018 17:50:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Lab5_wav_signal_synthesis_OpeningFcn, ...
                   'gui_OutputFcn',  @Lab5_wav_signal_synthesis_OutputFcn, ...
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


% --- Executes just before Lab5_wav_signal_synthesis is made visible.
function Lab5_wav_signal_synthesis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lab5_wav_signal_synthesis (see VARARGIN)

% Choose default command line output for Lab5_wav_signal_synthesis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lab5_wav_signal_synthesis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Lab5_wav_signal_synthesis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
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





% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=0:0.1:100;
R = str2num(get(handles.edit1,'string')) ;
L = str2num(get(handles.edit2,'string')) ;
C = str2num(get(handles.edit3,'string')) ;
a = [-R/L -1/L;1/C 0] ;
b = [1/L;0];
c = [1 0;0 1];
d = [0];
sys = ss(a,b,c,d) ;
Response = step(sys,t);

axes(handles.axes1);
plot(t,Response(:,1),'r');
xlabel('t/s','FontSize',12);
ylabel('il(t)','FontSize',12) ;
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 

axes(handles.axes2);
plot(t,Response(:,2),'g');
xlabel('t/s','FontSize',12);
ylabel('vc(t)','FontSize',12) ;
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 

axes(handles.axes3);
plot(Response(:,2),Response(:,1));
xlabel('vc(t)','FontSize',12) ;
ylabel('il(t)','FontSize',12) ;
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 

alph = R/(2*L) ;
omega = 1/sqrt(L*C);






function edit5_Callback(hObject, eventdata, handles)
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
