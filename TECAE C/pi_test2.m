% Establish a connection to the Raspberry Pi
pi = raspi('192.168.0.33', 'ismael', 'ismael'); % Use your Raspberry Pi's IP, username, and password

% Configure the I2C interface (assuming the default bus and MPU6050's address)
mpu6050 = i2cdev(pi, 'i2c-1', '0x68');

% Wake up the MPU6050 - write to the power management register
writeRegister(mpu6050, hex2dec('6B'), 0);

% Initialize matrices to store the data
tempData = [];

% Start time
startTime = datetime('now');

while seconds(datetime('now') - startTime) < 10
    % Read accelerometer data (registers 0x3B to 0x40)
    tempA = readRegister(mpu6050, hex2dec('41'), 1, 'int8');
    tempB = readRegister(mpu6050, hex2dec('42'), 1, 'int8');
    % tempD = double(typecast(uint8(temp(1:2)), 'int16')) / 340 + 36.53;

    tempD = (bitshift(tempA, 8) | uint16(tempB) ) / 340 + 36.53;
    
    % Store the data in matrices
    tempData = [tempData, tempD];
    
    pause(0.01); % Small pause to not overload the loop
end

plot(tempData, '-r');
title('Temperature');
xlabel('Sample');
ylabel('Temperature (Celcius)');