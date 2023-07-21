function varargout = Home_automation(varargin)
% HOME_AUTOMATION MATLAB code for Home_automation.fig
%      HOME_AUTOMATION, by itself, creates a new HOME_AUTOMATION or raises the existing
%      singleton*.
%
%      H = HOME_AUTOMATION returns the handle to a new HOME_AUTOMATION or the handle to
%      the existing singleton*.
%
%      HOME_AUTOMATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME_AUTOMATION.M with the given input arguments.
%
%      HOME_AUTOMATION('Property','Value',...) creates a new
%      HOME_AUTOMATION or raises thef
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Home_automation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Home_automation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Home_automation

% Last Modified by GUIDE v2.5 10-Jul-2017 10:00:43

% Begin initialization code
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_automation_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_automation_OutputFcn, ...
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


% --- Executes just before Home_automation is made visible.
function Home_automation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Home_automation (see VARARGIN)

% Choose default command line output for Home_automation
handles.output = hObject;

s=imread('L1.jpg');
axes(handles.axes1);
imshow(s);

s=imread('F1.jpg');
axes(handles.axes2);
imshow(s);

s=imread('T1.png');
axes(handles.axes3);
imshow(s);

% instrhwinfo('Bluetooth','HC-05');
% 
% bt = Bluetooth('HC-05', 1);
% 
% fopen(bt)
% 
% 
% handles.bt=bt;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home_automation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_automation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function BLINK_STATUS_Callback(hObject, eventdata, handles)
% hObject    handle to BLINK_STATUS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BLINK_STATUS as text
%        str2double(get(hObject,'String')) returns contents of BLINK_STATUS as a double


% --- Executes during object creation, after setting all properties.
function BLINK_STATUS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BLINK_STATUS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in START.
function START_Callback(hObject, eventdata, handles)
% hObject    handle to START (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% bt=handles.bt;

Flagstatus.flag1=0;
Flagstatus.flag2=0;
Flagstatus.flag3=0;

aaa='Acquiring EEG Signal';
set(handles.BLINK_STATUS,'String',aaa);
condition=0;
returncommand=0;
data = zeros(1,256);    %preallocate buffer

portnum1 = 4;   %COM Port #
comPortName1 = sprintf('\\\\.\\COM%d', portnum1);
TG_BAUD_57600 =      57600;
TG_STREAM_PACKETS =     0;
TG_DATA_RAW =         4;
loadlibrary('thinkgear64.dll','thinkgear.h');
fprintf('thinkgear64.dll loaded\n');
% dllVersion = calllib('thinkgear64', 'TG_GetDriverVersion');
% fprintf('thinkgear64 DLL version: %d\n', dllVersion );
connectionId1 = calllib('thinkgear64', 'TG_GetNewConnectionId');
if ( connectionId1 < 0 )
    error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1 ) );
end;

i=0;
while i< 3

currentpos=1;
a=imread('S1.jpg');
axes(handles.axes1);
imshow(a);
aa='Blink to Choose Forward';
bb='No Blinks Detected'
set(handles.BLINK_STATUS,'String',bb);
set(handles.BLINK_STATUS,'String',aa);
pause(1);
Flagstatus1=readblink(Flagstatus,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);
Flagstatus=Flagstatus1;
flag1=Flagstatus1.flag1;

if flag1==1
 g=imread('L2.jpg');
axes(handles.axes1);
imshow(g);
%                   fwrite(bt,'L');

else
    g=imread('L1.jpg');
axes(handles.axes1);
imshow(g);
%                   fwrite(bt,'R');

end
           

currentpos=2;
b=imread('S1.jpg');
axes(handles.axes2);
imshow(b);
aa='Blink to Choose Right';
set(handles.BLINK_STATUS,'String',aa);
bb='No Blinks Detected'
set(handles.BLINK_STATUS,'String',bb);
pause(1);
Flagstatus1=readblink(Flagstatus,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);
Flagstatus=Flagstatus1;
flag2=Flagstatus1.flag2;

if flag2==1
 e=imread('F2.jpg');
axes(handles.axes2);
imshow(e);
%                   fwrite(bt,'F');

else
    e=imread('F1.jpg');
axes(handles.axes2);
imshow(e);
%                   fwrite(bt,'B');

end




currentpos=3;
c=imread('S1.jpg');
axes(handles.axes3);
imshow(c);
aa='Blink to Choose Backward';
set(handles.BLINK_STATUS,'String',aa);
bb='No Blinks Detected'
set(handles.BLINK_STATUS,'String',bb);
pause(1);
Flagstatus1=readblink(Flagstatus,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);
Flagstatus=Flagstatus1;

flag3=Flagstatus1.flag3;
if flag3==1
 f=imread('T2.png');
axes(handles.axes3);
imshow(f);
%                   fwrite(bt,'W');

else
 f=imread('T1.png');
axes(handles.axes3);
imshow(f);
%                   fwrite(bt,'X');

end


%%%%%%%%%%%%%%

i=i+1;
end
%                  fwrite(bt,'S');
aaa='Press Start to Restart';
set(handles.BLINK_STATUS,'String',aaa);

function Flagstatus1=readblink(Flagstatus,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos)


flag1=Flagstatus.flag1;
flag2=Flagstatus.flag2;
flag3=Flagstatus.flag3;

Flagstatus1.flag1=flag1;
Flagstatus1.flag2=flag2;
Flagstatus1.flag3=flag3;

connectionId1 = calllib('thinkgear64', 'TG_GetNewConnectionId');
if ( connectionId1 < 0 )
    error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1 ) );
end;

% Attempt to connect the connection ID handle to serial port "COM3"
errCode = calllib('thinkgear64', 'TG_Connect',  connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS );
if ( errCode < 0 )
    error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
end

fprintf( 'Connected.  detecting blinks...\n' );


bb='Ready to capture Blinks'
        set(handles.BLINK_STATUS,'String',bb);

%%
%record data

j = 0;
i = 0;

%%%%%%%%%%%%choose left

while (i < 4240)   %loop for 20 seconds
    if (calllib('thinkgear64','TG_ReadPackets',connectionId1,1) == 1)   %if a packet was read...
        
      %  if (calllib('thinkgear64','TG_GetValueStatus',connectionId1,TG_DATA_RAW) ~= 0)   %if RAW has been updated 
            j = j + 1;
            i = i + 1;
            data(j) = calllib('thinkgear64','TG_GetValue',connectionId1,TG_DATA_RAW);
            csvwrite('C:\Users\junai\Desktop\BCI exp\HomeAuto.csv',data_att);
      %  end
    end
      if (j == 256)
     axes(handles.axes4);
          plotRAW(data);            %plot the data, update every .5 seconds (256 points)
       out=max(data);
       out1=min(data);
       if ((out > 300)  && (out1 < -300))
        amp=5 
        fs=1000  % sampling frequency
        duration=1
        freq=100
        values=0:1/fs:duration;
        a=amp*sin(2*pi* freq*values)
        sound(a)
        aa='Blink detected';
switch currentpos
          case 1
                
                if flag1==1
                    a=imread('L1.jpg');
                    axes(handles.axes1);
                    imshow(a);
                    flag1=0;
                    Flagstatus1.flag1=flag1;
                    Flagstatus1.flag2=flag2;
                    Flagstatus1.flag3=flag3;
%                   fwrite(bt,'R');


                    
                else
                    a=imread('L2.jpg');
                    axes(handles.axes1);
                    imshow(a);
                    flag1=1;
                    Flagstatus1.flag1=flag1;
                    Flagstatus1.flag2=flag2;
                    Flagstatus1.flag3=flag3;
%                   fwrite(bt,'L');
                    
                end

                pause(1);

          case 2
                if flag2==1
                    
                    a=imread('F1.jpg');
                    axes(handles.axes2);
                    imshow(a);
                    flag2=0;
                    Flagstatus1.flag1=flag1;
                    Flagstatus1.flag2=flag2;
                    Flagstatus1.flag3=flag3;
%                   fwrite(bt,'B');
                else
                    a=imread('F2.jpg');
                    axes(handles.axes2);
                    imshow(a);
                    flag2=1;
                    Flagstatus1.flag1=flag1;
                    Flagstatus1.flag3=flag3;
                    Flagstatus1.flag2=flag2;   
%                   fwrite(bt,'F');

               end
                pause(1);

          case 3
              
                if flag3==1
                    a=imread('T1.png');
                    axes(handles.axes3);
                    imshow(a);     
                    flag3=0;
                    Flagstatus1.flag1=flag1;
                    Flagstatus1.flag2=flag2;
                    Flagstatus1.flag3=flag3;                 
%                   fwrite(bt,'X');
                else
                    a=imread('T2.png');
                    axes(handles.axes3);
                    imshow(a);     
                    flag3=1;
                    Flagstatus1.flag1=flag1;
                    Flagstatus1.flag2=flag2;
                    Flagstatus1.flag3=flag3;
%                   fwrite(bt,'W');
        
                end
                pause(1);

            end
            set(handles.BLINK_STATUS,'String',aa);
             pause(1);
            break
             end
            j = 0;
      end
      
        end
%disconnect
calllib('thinkgear64', 'TG_FreeConnection', connectionId1 );



% --- Executes on button press in STOP.
function STOP_Callback(hObject, eventdata, handles)
% hObject    handle to STOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)