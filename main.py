import matplotlib.pyplot as plt
import numpy as np
from scipy import signal, fftpack
import cv2


image = cv2.imread('image.png', 0)
template = cv2.imread('template.png', 0)
im_fft = fftpack.fft(image)
tem_fft = fftpack.fft(template)

"""
plt.figure()
plot_spectrum(result)
plt.title('Fourier transform')

plt.show()
"""
