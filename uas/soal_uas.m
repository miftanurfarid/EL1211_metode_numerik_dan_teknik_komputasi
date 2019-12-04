% UJIAN AKHIR SEMESTER
% METODE NUMERIK DAN TEKNIK KOMPUTASI
% TEKNIK ELEKTRO - INSTITUT TEKNOLOGI KALIMANTAN

data = csvread('data.csv');

% plotting data
plot(data(1,:), data(2,:));
set(get(gca, 'XLabel'), 'String', '');
