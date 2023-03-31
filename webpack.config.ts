const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const port = process.env.PORT || 3000;
const ci = Boolean(process.env.CI || false);

module.exports = {
    mode: 'development', 
    entry: {
        app: './src/index.tsx'
    },
    module: {
        rules: [
        {
            test: /\.(ts|tsx)?$/,
            use: 'ts-loader',
            exclude: /node_modules/,
        },
        ],
    },
    resolve: {
        extensions: ['.tsx', '.ts', '.js', 'jsx'],
    },
    output: {
        filename: '[name].js',
        chunkFilename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist'),
        publicPath: '/'
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: 'public/index.html',
            filename: 'index.html'
        }),
        new HtmlWebpackPlugin({
            template: 'public/404.html',
            filename: '404.html'
        }),
    ],
    devServer: {
        host: 'localhost',
        port: port, 
        historyApiFallback: true,
        open: ci?['/webpack-react-ts-mpa-example']:false,
        static: __dirname+'/dist',
        hot: true
    }
};