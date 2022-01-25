# Chaotic-Encryption-and-Privilege-Based-Visual-Secret-Sharing-Model-for-Color-Images
This model comnines Privilege-based Visual Secret Sharing Model (PVSSM) and two-dimensional Logistic-Adjusted Sine Map (2D-LASM)
http://www.cai.sk/ojs/index.php/cai/article/view/2019_3_701


[Hou, Y.-C.|Quan, Z.-Y.|Tsai, C.-F.: A Privilege-Based Visual Secret Sharing
Model. Journal of Visual Communication and Image Representation, Vol. 33, 2015,
pp. 358-367, doi: 10.1016/j.jvcir.2015.10.005.]


[Hua, Z.|Zhou, Y.: Image encryption using 2D Logistic-adjusted-Sine map. Information Sciences, 
Vol. 339, 2016, pp. 237-253, doi: https://doi.org/10.1016/j.ins.2016.01.017]

In this paper, we aim to present the Chaotic Encryption-based PVSSM for
color images. The secret color image is first separated into RGB channels. Then,
RGB channels are transformed into binary images. PVSSM and 2D-LASM based
image encryption are applied respectively to each channel. Even if the shares are
captured and stacked, the secret image would not be seen. In decryption process,
the shares of each channel are decrypted with 2D-LASM and stacked. Recreated
RGB channels are merged. To obtain the original color image from the combined
RGB channels, the pixel values of 1 are changed to 255. Finally, the secret image is
revealed. Histogram analysis is applied for all R, G and B channels. In addition, for
observing the proposed method's performance on different image distortions, data
loss and salt-pepper noise attack are applied to the encrypted images. The results
show that this method has high resistance against these attacks.
