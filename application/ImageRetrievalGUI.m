function varargout = ImageRetrievalGUI(varargin)
% IMAGERETRIEVALGUI MATLAB code for ImageRetrievalGUI.fig
%      IMAGERETRIEVALGUI, by itself, creates a new IMAGERETRIEVALGUI or raises the existing
%      singleton*.
%
%      H = IMAGERETRIEVALGUI returns the handle to a new IMAGERETRIEVALGUI or the handle to
%      the existing singleton*.
%
%      IMAGERETRIEVALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGERETRIEVALGUI.M with the given input arguments.
%
%      IMAGERETRIEVALGUI('Property','Value',...) creates a new IMAGERETRIEVALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageRetrievalGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageRetrievalGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageRetrievalGUI

% Last Modified by GUIDE v2.5 13-Nov-2016 11:55:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageRetrievalGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageRetrievalGUI_OutputFcn, ...
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


% --- Executes just before ImageRetrievalGUI is made visible.
function ImageRetrievalGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageRetrievalGUI (see VARARGIN)

% Choose default command line output for ImageRetrievalGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageRetrievalGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageRetrievalGUI_OutputFcn(hObject, eventdata, handles) 
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



function edit4_Callback(hObject, eventdata, handles)
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



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
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
[filename,pathname]=uigetfile({'*.jpg'},'select image');
str=[pathname filename];
im = imread(str);
axes(handles.axes1);
imshow(im);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uiputfile({'*.jpg'},'save image');

str=strcat(pathname,filename);

pix=getframe(handles.axes1);

imwrite(pix.cdata,str,'jpg')


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.radiobutton2,'value') == 1
    type = 1;
    I = getimage(handles.axes1);
    str_Source = 'Corel_Source/';
    [RetrievalResultTop20,resultsort] = TestRetrieval(I,type);
    location=[handles.axes3,handles.axes4,handles.axes5,handles.axes6,handles.axes7,handles.axes8,handles.axes9,...
        handles.axes10,handles.axes11,handles.axes12,handles.axes13,handles.axes14,handles.axes15,handles.axes16,handles.axes17,...
        handles.axes18,handles.axes19,handles.axes20,handles.axes21,handles.axes22];
    %ButtonDown = [axes3_ButtonDownFcn];
%     ButtonDown = [axes3_ButtonDownFcn,axes4_ButtonDownFcn,axes5_ButtonDownFcn,axes6_ButtonDownFcn,axes7_ButtonDownFcn,axes8_ButtonDownFcn,...
%         axes9_ButtonDownFcn,axes10_ButtonDownFcn,axes11_ButtonDownFcn,axes12_ButtonDownFcn,axes13_ButtonDownFcn,axes14_ButtonDownFcn,axes15_ButtonDownFcn,...
%         axes16_ButtonDownFcn,axes17_ButtonDownFcn,axes18_ButtonDownFcn,axes19_ButtonDownFcn,axes20_ButtonDownFcn,axes21_ButtonDownFcn,axes22_ButtonDownFcn];
%     MyOwnCallback = [@myCallback1,@myCallback2,@myCallback3,@myCallback4,@myCallback5,@myCallback6,@myCallback7,@myCallback8,@myCallback9,@myCallback10,...
%         @myCallback11,@myCallback12,@myCallback13,@myCallback14,@myCallback15,@myCallback16,@myCallback17,@myCallback18,@myCallback19,@myCallback20,...
%         @myCallback21,@myCallback22];
     %MyOwnCallback = [@myCallback1];
    %callImage = [];
    for i = 1:20
        axes(location(1,i));
        RetrievalID = RetrievalResultTop20(i,1);
        I_Result = imread([str_Source,num2str(RetrievalID),'.jpg']);
        %callImage=[callImage imshow(I_Result)];
        %hlimage = imshow(I_Result);
        %set(hlimage,'axes3_ButtonDownFcn',@myCallback1);
        %handles.hlimage=hlimage;
        %guidata(hObject, handles);
        imshow(I_Result);
        title(['score= ',num2str(100*(1-resultsort(i,1)))]);
    end
end

if get(handles.radiobutton3,'value') == 1
    type = 2;
    I = getimage(handles.axes1);
    str_Source = 'Corel_Source/';
    [RetrievalResultTop20,resultsort] = TestRetrieval(I,type);
    location=[handles.axes3,handles.axes4,handles.axes5,handles.axes6,handles.axes7,handles.axes8,handles.axes9,...
        handles.axes10,handles.axes11,handles.axes12,handles.axes13,handles.axes14,handles.axes15,handles.axes16,handles.axes17,...
        handles.axes18,handles.axes19,handles.axes20,handles.axes21,handles.axes22];
    
     for i = 1:20
        axes(location(1,i));
        RetrievalID = RetrievalResultTop20(i,1);
        I_Result = imread([str_Source,num2str(RetrievalID),'.jpg']);
        %callImage=[callImage imshow(I_Result)];
        %hlimage = imshow(I_Result);
        %set(hlimage,'axes3_ButtonDownFcn',@myCallback1);
        %handles.hlimage=hlimage;
        %guidata(hObject, handles);
        imshow(I_Result);
        title(['score= ',num2str(100*(1-resultsort(i,1)))]);
    end
end
    
        
    



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 I1 = getimage(handles.axes1);
 I2 = getimage(handles.axes2);
 img_rgb = PseudoColorization(I2,I1);
% imshow(uint8(img_rgb));
figure;
subplot(1,3,1);
imshow(I1);
subplot(1,3,2);
imshow(I2);
subplot(1,3,3);
imshow(img_rgb);



% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if get(hObject,'value') == 1
set(handles.radiobutton3,'value',0);
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
if get(hObject,'value') == 1
set(handles.radiobutton2,'value',0);
end




% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
if get(hObject,'value') == 1
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes3);
imshow(I);


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes4);
imshow(I);


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes5);
imshow(I);


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes6);
imshow(I);


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes7);
imshow(I);


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes8);
imshow(I);


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes9);
imshow(I);


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes10);
imshow(I);


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes11);
imshow(I);


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes12);
imshow(I);


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes13);
imshow(I);


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes14);
imshow(I);


% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes15);
imshow(I);


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes16);
imshow(I);


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes17);
imshow(I);


% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton19
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes18);
imshow(I);


% --- Executes on button press in radiobutton20.
function radiobutton20_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton20
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes19);
imshow(I);


% --- Executes on button press in radiobutton21.
function radiobutton21_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton21
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton22,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes20);
imshow(I);


% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton23,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes21);
imshow(I);


% --- Executes on button press in radiobutton23.
function radiobutton23_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton23
if get(hObject,'value') == 1
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
set(handles.radiobutton9,'value',0);
set(handles.radiobutton10,'value',0);
set(handles.radiobutton11,'value',0);
set(handles.radiobutton12,'value',0);
set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',0);
set(handles.radiobutton15,'value',0);
set(handles.radiobutton16,'value',0);
set(handles.radiobutton17,'value',0);
set(handles.radiobutton18,'value',0);
set(handles.radiobutton19,'value',0);
set(handles.radiobutton20,'value',0);
set(handles.radiobutton21,'value',0);
set(handles.radiobutton22,'value',0);
end
axes(handles.axes2);
I = getimage(handles.axes22);
imshow(I);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1