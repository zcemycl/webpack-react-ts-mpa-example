import puppeteer from 'puppeteer';
const ci = Boolean(process.env.CI || false);
jest.setTimeout(50000)

let opts: string[];

if (!ci) {
    opts = ['--window-size=640,480']
} else {
    opts = [
        '--ignore-certificate-errors',
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-accelerated-2d-canvas',
        '--disable-gpu']
}

const itif = ( condition: boolean ) => condition?it:it.skip

describe('e2e with jest-puppeteer', () => {
    let browser: puppeteer.Browser;
    beforeEach(async () => {
        browser = await puppeteer.launch({
            headless: ci, 
            slowMo: ci?0:80,
            args: opts,
        });
    })

    afterEach(async () => {
        await browser.close()
    })

    itif(!ci)('get button click', async() => {
        const page = await browser.newPage();
        await page.goto('http://localhost:3000/webpack-react-ts-mpa-example', 
            { waitUntil: 'domcontentloaded' })
        const btn = await page.$('button');
        await btn?.click();
        const selector = '[data-testid=numlist]'
        await page.waitForSelector(selector)
        const innerText = await page.evaluate((sel) => {
            const cand = document.querySelector(sel) as HTMLElement;
            return cand?.innerText;
        }, selector)
        expect(innerText).not.toBe('');
    })

    it('get paragraph without click', async() => {
        const page = await browser.newPage();
        const resp = await page.goto('http://localhost:3000/webpack-react-ts-mpa-example', 
            { waitUntil: 'domcontentloaded' })
        const selector = '[data-testid=numlist]'
        await page.waitForSelector(selector)
        const innerText = await page.evaluate((sel) => {
            const cand = document.querySelector(sel) as HTMLElement;
            return cand?.innerText;
        }, selector)
        expect(innerText).toBe('');
    })
})