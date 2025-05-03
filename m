ilk başta girdiğim tanımlama kodu:

% Motor transfer fonksiyonu
num_motor = 0.08;
den_motor = [2e-6, 0.014401, 0.0064072];
sys_motor = tf(num_motor, den_motor);

% Mekanik sistem transfer fonksiyonu
num_mech = 5;
den_mech = [1, 10, 50];
sys_mech = tf(num_mech, den_mech);

% Genel sistem transfer fonksiyonu
sys_total = series(sys_motor, sys_mech);  % veya
% sys_total = tf(conv(num_motor * num_mech, 1), conv(den_motor, den_mech));


______
impulse grafiği kodu:

impulse(sys_total);
title('Genel Sistem Darbe Cevabı - impulse()');
grid on;
______
step grafiği kodu:

step(sys_total);
title('Genel Sistem Birim Basamak Cevabı - step()');
grid on;

_____
yukardaki sistem tanımlamasını sonradan sildiğim için tf yi bir daha tanımladığım ve Durum uzayı modelinin matris değerlerini veren kod:


% Transfer fonksiyonunun tanımı
num = 0.4;
den = conv([2e-6, 0.014401, 0.0064072], [1, 10, 50]);  % Paydanın çarpımı

sys_tf = tf(num, den);  % Transfer fonksiyonu oluşturma
sys_ss = ss(sys_tf);    % Durum uzayı modeline dönüştürme

A = sys_ss.A
B = sys_ss.B
C = sys_ss.C
D = sys_ss.D

____
matrisin öz değer kodu:


eig(A)


____
durum uzayı modeli sys için transmisyon sıfırlarını hesaplama:

sys = ss(A, B, C, D);
tzero(sys)
