import ffmpeg

(
	ffmpeg.input("input.mp4")
	.output('audio.mp3')
	.run()
)