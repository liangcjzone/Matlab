robj = audiorecorder(44100,16,1);  %���ò���Ƶ�ʡ�����λ����ͨ����
recordblocking(robj,0.1);            %�ɼ��������ݣ�1s���ȣ�
rdata = getaudiodata(robj);        %��ȡ��Ƶ����
plot(rdata);                       %���Ʋ���
axis([1,44100,-0.1,0.1]);          %���ù̶�������
drawnow                            %ˢ����ʾ
n = 100;                           %�趨�����Ĳ������´�����n��m�����ϼ����������ʱ�䳤��
m = 0.1;                           %�趨���¼����mԽС����Խ����
while n>1
    recordblocking(robj,m);
    rlen = length(rdata);          %��ȡ���ݳ���
    olddata = rdata(floor(rlen*m):rlen,1);     %�����ľ�����
    rdata = [olddata ; getaudiodata(robj)];    %����ʾ������ = ������ + ������
    plot(rdata);
    axis([1,44100,-0.1,0.1]);
    drawnow
    n = n-1;
end
