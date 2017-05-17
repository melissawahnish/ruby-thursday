export const fadeIn = (el, ms = 400) => {
  el.style.opacity = 0;
  el.style.display = 'block';

  let last = +new Date();
  const tick = () => {
    el.style.opacity = +el.style.opacity + (new Date() - last) / ms;
    last = +new Date();

    if (+el.style.opacity < 1) {
      (window.requestAnimationFrame && requestAnimationFrame(tick)) || setTimeout(tick, 16);
    }
  };

  tick();
}

export const fadeOut = (el, ms = 400) => {
  el.style.opacity = 1;

  let last = +new Date();
  const tick = () => {
    el.style.opacity = +el.style.opacity - (new Date() - last) / ms;
    last = +new Date();

    if (+el.style.opacity > 0) {
      (window.requestAnimationFrame && requestAnimationFrame(tick)) || setTimeout(tick, 16);
    } else {
      el.style.display = 'none';
    }
  };

  tick();
}
