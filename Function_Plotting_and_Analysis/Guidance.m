function varargout = Guidance(varargin)
% GUIDANCE MATLAB code for Guidance.fig
%      GUIDANCE, by itself, creates a new GUIDANCE or raises the existing
%      singleton*.
%
%      H = GUIDANCE returns the handle to a new GUIDANCE or the handle to
%      the existing singleton*.
%
%      GUIDANCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDANCE.M with the given input arguments.
%
%      GUIDANCE('Property','Value',...) creates a new GUIDANCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Guidance_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Guidance_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guidance

% Last Modified by GUIDE v2.5 24-Feb-2019 13:42:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guidance_OpeningFcn, ...
                   'gui_OutputFcn',  @Guidance_OutputFcn, ...
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


% --- Executes just before Guidance is made visible.
function Guidance_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guidance (see VARARGIN)

% Choose default command line output for Guidance
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guidance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Guidance_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(Guidance);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
