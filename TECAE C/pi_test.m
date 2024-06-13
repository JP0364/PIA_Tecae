% Establish a connection to the Raspberry Pi
pi = raspi('192.168.0.98', 'pi', 'pi'); % Use your Raspberry Pi's IP, username, and password

% Configure the I2C interface (assuming the default bus and MPU6050's address)
mpu6050 = i2cdev(pi, 'i2c-1', '0x68');

% Wake up the MPU6050 - write to the power management register
writeRegister(mpu6050, hex2dec('6B'), 0);

% Configure Accelerometer sensitivity
writeRegister(mpu6050, hex2dec('1C'), 0);
% 
% % Prepara matrices para almacenar los datos
% accXData = [];
% accYData = [];
% accZData = [];
% gyroXData = [];
% gyroYData = [];
% gyroZData = [];
% 
% % Tiempo de inicio
% startTime = datetime('now');
% 
% % Bucle para leer datos del sensor durante 10 segundos
% while seconds(datetime('now') - startTime) < 10
%     % Lee datos del acelerómetro (registros 0x3B a 0x40)
%     accData = readRegister(mpu6050, hex2dec('3B'), 6,'int16');
%     accX = double(typecast(int16(accData(1:2)), 'int16')) / 16384;
%     accY = double(typecast(int16(accData(3:4)), 'int16')) / 16384;
%     accZ = double(typecast(int16(accData(5:6)), 'int16')) / 16384;
% 
%     % % Lee datos del giróscopo (registros 0x43 a 0x48)
%     % gyroData = readRegister(mpu6050, hex2dec('43'), 6, 'int16');
%     % gyroX = double(typecast(uint8(gyroData(1:2)), 'int16')) / 131;
%     % gyroY = double(typecast(uint8(gyroData(3:4)), 'int16')) / 131;
%     % gyroZ = double(typecast(uint8(gyroData(5:6)), 'int16')) / 131;
% 
%     % Almacena los datos en matrices
%     accXData = [accXData, accX];
%     accYData = [accYData, accY];
%     accZData = [accZData, accZ];
%     % gyroXData = [gyroXData, gyroX];
%     % gyroYData = [gyroYData, gyroY];
%     % gyroZData = [gyroZData, gyroZ];
% 
%     pause(0.01); % Pequeña pausa para no sobrecargar el bucle
% end
% 
% % % Plot de los datos del acelerómetro
% % subplot(2,1,1);
% % plot(accXData, '-r', accYData, '-g', accZData, '-b');
% % title('Acelerómetro');
% % xlabel('Muestra');
% % ylabel('Aceleración (g)');
% % legend('X', 'Y', 'Z');
% % 
% % % Plot de los datos del giróscopo
% % subplot(2,1,2);
% % plot(gyroXData, '-r', gyroYData, '-g', gyroZData, '-b');
% % title('Giróscopo');
% % xlabel('Muestra');
% % ylabel('Velocidad angular (°/s)');
% % legend('X', 'Y', 'Z');
% 
% 
% 
% % Plot de los datos del acelerómetro
% % subplot(2,1,1);
% hold on; % Mantiene el gráfico actual y añade nuevos gráficos
% plot(accXData, '-r');
% plot(accYData, '-g');
% plot(accZData, '-b');
% % hold off; % Libera el gráfico para nuevos plots
% title('Acelerómetro');
% xlabel('Muestra');
% ylabel('Aceleración (g)');
% legend('X', 'Y', 'Z');
% 
% % % Plot de los datos del giróscopo
% % subplot(2,1,2);
% % hold on;
% % plot(gyroXData, '-r');
% % plot(gyroYData, '-g');
% % plot(gyroZData, '-b');
% % % hold off;
% % title('Giróscopo');
% % xlabel('Muestra');
% % ylabel('Velocidad angular (°/s)');
% % legend('X', 'Y', 'Z');

%% Intento 2 %%

% % Establish a connection to the Raspberry Pi
% pi = raspi('192.168.0.30', 'ismael', 'ismael'); % Use your Raspberry Pi's IP, username, and password
% 
% % Configure the I2C interface (assuming the default bus and MPU6050's address)
% mpu6050 = i2cdev(pi, 'i2c-1', '0x68');

% Wake up the MPU6050 - write to the power management register
writeRegister(mpu6050, hex2dec('6B'), 0);

% Configure Accelerometer sensitivity
writeRegister(mpu6050, hex2dec('1C'), 0);

% Initialize matrices to store the data
accXData = [];
accYData = [];
accZData = [];
gyroXData = [];
gyroYData = [];
gyroZData = [];

% Start time
startTime = datetime('now');

% Loop to read sensor data for 10 seconds
while seconds(datetime('now') - startTime) < 120
    % Read accelerometer data (registers 0x3B to 0x40)
    accData = readRegister(mpu6050, hex2dec('3B'), 6, 'int16');
    accX = double(typecast(int16(accData(1:2)), 'int16')) / 16384;
    accY = double(typecast(int16(accData(3:4)), 'int16')) / 16384;
    accZ = double(typecast(int16(accData(5:6)), 'int16')) / 16384;
    
    % Read gyroscope data (registers 0x43 to 0x48)
    gyroData = readRegister(mpu6050, hex2dec('43'), 6, 'int16');
    gyroX = double(typecast(int16(gyroData(1:2)), 'int16')) / 131;
    gyroY = double(typecast(int16(gyroData(3:4)), 'int16')) / 131;
    gyroZ = double(typecast(int16(gyroData(5:6)), 'int16')) / 131;
    
    % Store the data in matrices
    accXData = [accXData, accX];
    accYData = [accYData, accY];
    accZData = [accZData, accZ];
    gyroXData = [gyroXData, gyroX];
    gyroYData = [gyroYData, gyroY];
    gyroZData = [gyroZData, gyroZ];
    
    pause(0.01); % Small pause to not overload the loop
end

% Plot the accelerometer data
subplot(2,1,1); % Creates a subplot for accelerometer data
hold on; % Keeps the current plot and adds new plots
plot(accXData, '-r');
plot(accYData, '-g');
plot(accZData, '-b');
title('Accelerometer');
xlabel('Sample');
ylabel('Acceleration (g)');
legend('X', 'Y', 'Z');
hold off; % Releases the plot for new plots

% Plot the gyroscope data
subplot(2,1,2); % Creates a subplot for gyroscope data
hold on;
plot(gyroXData, '-r');
plot(gyroYData, '-g');
plot(gyroZData, '-b');
title('Gyroscope');
xlabel('Sample');
ylabel('Angular velocity (°/s)');
legend('X', 'Y', 'Z');
hold off;
