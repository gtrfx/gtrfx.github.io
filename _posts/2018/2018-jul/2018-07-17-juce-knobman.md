---
layout: post
title: "Juce에서 knobman 이용하기"
tags: [juce, c++]
categories:
    - computer
---

Juce에서는 WDL-OL처럼 knobman을 직접 지원하진 않는다. 요새 플러그인의 UI를 보면 knobman을 써서 만들 수 있는 knob보다 더 이쁜 것들이 많고 3D renderer를 쓴 것 같은 느낌이 난다. 어쨌든 이러한 경우 조각그림들을 가로 혹은 세로로 이어붙여 하나의 파일로 만들고 그것들을 아래와 같은 방법으로 찍어내게 하면 된다. 어려운 코드도 아니고 웬지 로드를 많이 잡아먹을 듯한 코드이지만, 이렇게 작성해서 나오는 상용제품도 많은 듯하니까 그냥 맘편히 써도 될 것 같다. (나 같으면 별로 타협 못할 것 같지만)


```
class FilmStripSlider
{
	public:
		FilmStripSlider (Image *_knobStrip);
		void drawFrame (Graphics &g, int x, int y, int width, int height, Slider &slider);

	private:
		Image *knobStrip;
		int frameCount;
		int frameSize;
		bool isVerticalStrip;
};
```
```
FilmStripSlider::FilmStripSlider (Image *_knobStrip) : knobStrip(_knobStrip)
{
	if (knobStrip->getWidth() > knobStrip->getHeight())
	{
		frameCount		= knobStrip->getWidth() / knobStrip->getHeight();
		frameSize		= knobStrip->getHeight();
		isVerticalStrip	= false;
	}
	else
	{
		frameCount		= knobStrip->getHeight() / knobStrip->getWidth();
		frameSize		= knobStrip->getWidth();
		isVerticalStrip	= true;
	}
}

/* thanks to anita for the math */

void FilmStripSlider::drawFrame (Graphics &g, int x, int y, int width, int height, Slider &slider)
{
	const double div	= slider.getMaximum() / frameCount;
	double pos			= (int)(slider.getValue() / div);

	if (pos > 0)
		pos = pos - 1;

	if (width != height) /* scale */
	{
		x		= (width / 2) - (height / 2);
		width	= height;
	}

	if (isVerticalStrip)
	{
		g.drawImage (knobStrip, x, y, width, height, 0, (int)(pos*frameSize), frameSize, frameSize, false);
	}
	else
	{
		g.drawImage (knobStrip, x, y, width, height, (int)(pos*frameSize), 0, frameSize, frameSize, false);
	}
}
```