function varargout = Blocks(varargin)
% BLOCKS MATLAB code for Blocks.fig
%      BLOCKS, by itself, creates a new BLOCKS or raises the existing
%      singleton*.
%
%      H = BLOCKS returns the handle to a new BLOCKS or the handle to
%      the existing singleton*.
%
%      BLOCKS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BLOCKS.M with the given input arguments.
%
%      BLOCKS('Property','Value',...) creates a new BLOCKS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Blocks_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Blocks_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Blocks

% Last Modified by GUIDE v2.5 07-Jun-2017 11:55:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Blocks_OpeningFcn, ...
                   'gui_OutputFcn',  @Blocks_OutputFcn, ...
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


% --- Executes just before Blocks is made visible.
function Blocks_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Blocks (see VARARGIN)

% Choose default command line output for Blocks
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Blocks wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Blocks_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

for blockNo = 1:length(blocks)
% --- Executes on button press in pushbutton1.
eval(['function pushbutton' num2str(blockNo) '_Callback(hObject, eventdata, handles)']);
ansTemp = buildBlock();
eval(['block' num2str(blockNo) ' = ansTemp;'])
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
