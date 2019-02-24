function varargout = beginning(varargin)
% BEGINNING MATLAB code for beginning.fig
%      BEGINNING, by itself, creates a new BEGINNING or raises the existing
%      singleton*.
%
%      H = BEGINNING returns the handle to a new BEGINNING or the handle to
%      the existing singleton*.
%
%      BEGINNING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEGINNING.M with the given input arguments.
%
%      BEGINNING('Property','Value',...) creates a new BEGINNING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before beginning_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to beginning_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help beginning

% Last Modified by GUIDE v2.5 24-Feb-2019 13:09:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @beginning_OpeningFcn, ...
                   'gui_OutputFcn',  @beginning_OutputFcn, ...
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


% --- Executes just before beginning is made visible.
function beginning_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to beginning (see VARARGIN)

% Choose default command line output for beginning
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes beginning wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = beginning_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in draw.
function draw_Callback(hObject, eventdata, handles)
% hObject    handle to draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawTool;


% --- Executes on button press in analyze.
function analyze_Callback(hObject, eventdata, handles)
% hObject    handle to analyze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
diffTool;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(beginning);
