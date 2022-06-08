<article class="markdown-body entry-content container-lg" itemprop="text"><h1 dir="auto"><a id="user-content-robdanns" class="anchor" aria-hidden="true" href="#robdanns"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Modeling and Optimizing Topology Robustness of IoT against Targeted Attacks</h1>
<p dir="auto"><a href="https://www.mathworks.com/products/new_products/release2021a.html" rel="nofollow"><img src="https://img.shields.io/badge/MATLAB-R2021a-green" alt="Matlab" data-canonical-src="https://img.shields.io/badge/MATLAB-R2021a-green" style="max-width: 100%;"></a></p>
<p dir="auto">This repository contains implementation codes of our researh articles, <a href="#" rel="nofollow"><code> </code></a>which is under review at <a href="#" rel="nofollow">Computer Communication General</a>.</p>
<h2 dir="auto"><a id="user-content-contents" class="anchor" aria-hidden="true" href="#contents"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Contents</h2>
<ul dir="auto">
<li><a href="#overview">Overview</a></li>
<li><a href="#repo-contents">Repo Contents</a></li>
<li><a href="#code-setup">Code Setup</a></li>
<li><a href="#plots-for-results">Plots</a></li>
<li><a href="/Waasem/RobDanns/blob/main/LICENSE">License</a></li>
<li><a href="https://github.com/Waasem/RobDanns/pulls">Issues</a></li>
<li><a href="#citation">Citation</a></li>
</ul>
<h2 dir="auto"><a id="user-content-overview" class="anchor" aria-hidden="true" href="#overview"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Overview</h2>
<p dir="auto">Deep artificial neural networks (DANNs) have varying predictive performance when their architectures change.  This study encompasses three parts:</p>
<ul dir="auto">
<li>Part 1.</li>
<li>Part 2.</li>
<li>Part 3.</li>
</ul>
<p dir="auto">This work shows that the topological entropy and Olivier-Ricci curvature of the underlying graphs can quantify the robustness of DANNs.</p>
<p dir="auto"><strong>TLDR</strong>: We explore neural networks for their robustness against adversarial attacks through the lens of graph theory.</p>
<div dir="auto" align="center">
        <a target="_blank" rel="noopener noreferrer" href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs/overview.png"><img src="/Waasem/RobDanns/raw/main/deep_learning/docs/figs/overview.png" style="max-width: 100%;" width="1100px"></a>
        <p dir="auto" align="center"><b>Overview.</b> Image text and text.</p>
</div>
<h2 dir="auto"><a id="user-content-repo-contents" class="anchor" aria-hidden="true" href="#repo-contents"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Repo Contents</h2>
<p dir="auto">The repository has two parts:</p>
<ul dir="auto">
<li><a href="/Waasem/RobDanns/blob/main/deep_learning"><code>Deep learning</code></a>: <code>Deep learning code</code> for exploring the DANNs using  an image classification codebase built by FAIR.</li>
<li><a href="/Waasem/RobDanns/blob/main/graph_theory"><code>Graph theory</code></a>: <code>Graph theory code</code> where graph theoretical properties of architectures of DANNs are calculated. </li>
</ul>
<h2 dir="auto"><a id="user-content-code-setup" class="anchor" aria-hidden="true" href="#code-setup"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Code setup</h2>
<h3 dir="auto"><a id="user-content-1-deep-learning-domain" class="anchor" aria-hidden="true" href="#1-deep-learning-domain"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>1 Deep Learning Domain</h3>
<p dir="auto"><strong>Requirements:</strong></p>
<ul dir="auto">
<li>NVIDIA GPU, Linux, Python3</li>
<li>PyTorch, Python packages with installation instructions found below.</li>
</ul>
<p dir="auto"><strong>Python environment:</strong>
Use Conda or virtualenv package manager</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto"><pre>conda create -n RobDanns python=3.6
conda activate RobDanns</pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="conda create -n RobDanns python=3.6
conda activate RobDanns" tabindex="0" role="button">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
<p dir="auto"><strong>Pytorch:</strong>
Install <a href="https://pytorch.org/" rel="nofollow">PyTorch</a> with <strong>CUDA</strong> support (CPU version is not supported). The code has been verified with PyTorch 1.4.0 and torchvision 0.5.0.</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto"><pre>pip install torch==1.4.0 torchvision==0.5.0 torchattacks==3.2.1</pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="pip install torch==1.4.0 torchvision==0.5.0 torchattacks==3.2.1" tabindex="0" role="button">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
<p dir="auto"><strong>Clone RobDanns repository and install:</strong></p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto"><pre>git clone https://github.com/Waasem/RobDanns.git
<span class="pl-c1">cd</span> RobDanns/deep_learning
pip install -r requirements.txt
python setup.py develop</pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="git clone https://github.com/Waasem/RobDanns.git
cd RobDanns/deep_learning
pip install -r requirements.txt
python setup.py develop" tabindex="0" role="button">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
<p dir="auto"><strong>Download datasets:</strong></p>
<p dir="auto">Download <a href="https://www.cs.toronto.edu/~kriz/cifar.html" rel="nofollow"><code>CIFAR-10 dataset</code></a>, <a href="https://www.cs.toronto.edu/~kriz/cifar.html" rel="nofollow"><code>CIFAR-100 dataset</code></a>, <a href="http://cs231n.stanford.edu/tiny-imagenet-200.zip" rel="nofollow"><code>TinyImageNet dataset</code></a>, <a href="https://image-net.org/download" rel="nofollow"><code>ImageNet dataset</code></a>
Uncompress the datasets then link the datasets with our code using following commands.</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto"><pre><span class="pl-c"><span class="pl-c">#</span> CIFAR-10</span>
mkdir -p pycls/datasets/data
wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
tar -xvf cifar-10-python.tar.gz
DIR=<span class="pl-s"><span class="pl-pds">$(</span>readlink -f cifar-10-batches-py<span class="pl-pds">)</span></span>
ln -s <span class="pl-smi">$DIR</span> pycls/datasets/data/cifar10 <span class="pl-c"><span class="pl-c">#</span> symlink</span>

<span class="pl-c"><span class="pl-c">#</span> CIFAR-100 (optional)</span>
mkdir -p pycls/datasets/data
wget https://www.cs.toronto.edu/~kriz/cifar-100-python.tar.gz
tar -xvf cifar-100-python.tar.gz
DIR=<span class="pl-s"><span class="pl-pds">$(</span>readlink -f cifar-100-python<span class="pl-pds">)</span></span>
ln -s <span class="pl-smi">$DIR</span> pycls/datasets/data/cifar100 <span class="pl-c"><span class="pl-c">#</span> symlink</span>

<span class="pl-c"><span class="pl-c">#</span> TinyImageNet (optional)</span>
mkdir -p pycls/datasets/data
wget http://cs231n.stanford.edu/tiny-imagenet-200.zip
<span class="pl-c"><span class="pl-c">#</span> unzip and link the directory </span>
ln -s (path to tinyimagenet200) pycls/datasets/data/tinyimagenet200 <span class="pl-c"><span class="pl-c">#</span> symlink</span>

<span class="pl-c"><span class="pl-c">#</span> ImageNet (optional)</span>
mkdir -p pycls/datasets/data/imagenet
<span class="pl-c"><span class="pl-c">#</span> Then download ImageNet following their official website</span>
ln -s (path to ImageNet) pycls/datasets/data/imagenet <span class="pl-c"><span class="pl-c">#</span> symlink</span></pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="# CIFAR-10
mkdir -p pycls/datasets/data
wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
tar -xvf cifar-10-python.tar.gz
DIR=$(readlink -f cifar-10-batches-py)
ln -s $DIR pycls/datasets/data/cifar10 # symlink

# CIFAR-100 (optional)
mkdir -p pycls/datasets/data
wget https://www.cs.toronto.edu/~kriz/cifar-100-python.tar.gz
tar -xvf cifar-100-python.tar.gz
DIR=$(readlink -f cifar-100-python)
ln -s $DIR pycls/datasets/data/cifar100 # symlink

# TinyImageNet (optional)
mkdir -p pycls/datasets/data
wget http://cs231n.stanford.edu/tiny-imagenet-200.zip
# unzip and link the directory 
ln -s (path to tinyimagenet200) pycls/datasets/data/tinyimagenet200 # symlink

# ImageNet (optional)
mkdir -p pycls/datasets/data/imagenet
# Then download ImageNet following their official website
ln -s (path to ImageNet) pycls/datasets/data/imagenet # symlink" tabindex="0" role="button">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
<p dir="auto">The expected dataset structures are explained in <a href="/Waasem/RobDanns/blob/main/deep_learning/docs/DATA.md">DATA.md</a> file.</p>
<p dir="auto"><strong>Run the code:</strong></p>
<p dir="auto">A clean repo for reproducing multiple experimental setups related to deep learning code is provided here.
The raw experimental configs related to all datasets available in <a href="/Waasem/RobDanns/blob/main/deep_learning/configs/baselines">deep_learning/configs/baselines/</a> directory. For individual experiments, the .yaml files in each sub-directory of <a href="/Waasem/RobDanns/blob/main/deep_learning/configs/baselines">deep_learning/configs/baselines/</a> can be used as training configuration.</p>
<p dir="auto"><strong>Run the model for training:</strong></p>
<p dir="auto">Train your DANN models through following commands.</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto"><pre><span class="pl-c"><span class="pl-c">#</span> Explaining the arguments:</span>
<span class="pl-c"><span class="pl-c">#</span> Tasks: mlp_cifar10, cnn_ cifar10, cnn_cifar100, resnet18_tinyimagenet, resnet18_tinyimagenet</span>
<span class="pl-c"><span class="pl-c">#</span> Division: all</span>
<span class="pl-c"><span class="pl-c">#</span> GPU: 1</span>
<span class="pl-c1">cd</span> RobDanns/deep_learning
bash launch.sh mlp_cifar10 all 1
bash launch.sh cnn_cifar10 all 1
bash launch.sh cnn_cifar100 all 1
bash launch.sh resnet18_tinyimagenet all 1
bash launch-tinyimagenet.sh resnet18_tinyimagenet all 1</pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="# Explaining the arguments:
# Tasks: mlp_cifar10, cnn_ cifar10, cnn_cifar100, resnet18_tinyimagenet, resnet18_tinyimagenet
# Division: all
# GPU: 1
cd RobDanns/deep_learning
bash launch.sh mlp_cifar10 all 1
bash launch.sh cnn_cifar10 all 1
bash launch.sh cnn_cifar100 all 1
bash launch.sh resnet18_tinyimagenet all 1
bash launch-tinyimagenet.sh resnet18_tinyimagenet all 1" tabindex="0" role="button">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
<h3 dir="auto"><a id="user-content-2-graph-calculations" class="anchor" aria-hidden="true" href="#2-graph-calculations"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>2 Graph Calculations</h3>
<p dir="auto">Given in the <a href="/Waasem/RobDanns/blob/main/graph_theory">Graph theory</a> directory. The code in this directory is based on MATLAB. Here we calculate the graph measures of our DANNs. We recommend using <a href="https://www.mathworks.com/products/new_products/release2020a.html" rel="nofollow">Matlab R_2020a</a>.  Because of the large number of experiments and huge space requirements for files containing the Adjacency Matrices (~100GB), we have not uploaded these files. However, here we present a method to find the adjacency matrices of the graphs and the code to perform the graph-theoretical analysis on the generated graphs, as given below:</p>
<p dir="auto"><strong>Graph generation:</strong></p>
<p dir="auto">Before running this code part, we need to find and store the Adjacency Matrices of graphs of architectures of our DANNs. We have placed a notebook file <a href="/Waasem/RobDanns/blob/main/deep_learning/analysis/generate_graphs.ipynb">generate_graphs.ipynb</a> in the <a href="/Waasem/RobDanns/blob/main/deep_learning/analysis"><code>Deep learning/analysis</code></a> directory. This notebook can be used to generate Adjacency Matrices for our Relational Graphs experiments. In our experiments, we generate 2.313 Million WS-flex graphs, sub-sample them through coarse bins to 3854, 441, and 54 graphs. These sub-sampled graphs along with the corresponding Adjacency Matrices can be saved for analysis in the graph theory domain. Similar methodology can be followed to generate and save graphs from any random graph generator.</p>
<p dir="auto"><strong>Calculate graph-theoretic measures:</strong></p>
<p dir="auto">Once we have Adjacency Matrices of our graphs, we can feed them as input to the file <a href="/Waasem/RobDanns/blob/main/graph_theory/main.m">main.m</a>. For each of the graph models, users can comment / uncomment the code blocks in this file and run the code. The resulting .mat file would contain the Adjacency matrix, degree, clustering coefficient, average path length, characteristic path length, global efficiency, algebraic connectivity, entropy, and curvature. Note: this can be a time consuming process.</p>
<h2 dir="auto"><a id="user-content-plots-for-results" class="anchor" aria-hidden="true" href="#plots-for-results"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Plots for results</h2>
<p dir="auto">The plots for our experimental results reported in our main paper as well as the supplementary section are located in the directory <a href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs">figs</a>. The statistical analysis results reported herein were performed in the Microsoft Excel's Data Analysis toolbox.</p>
<ul dir="auto">
<li>Accuracy Plots for all Experiments: The predictive accuracy (in %) plots of all DANNs on respective datasets are compiled in <a href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs/accuracy_results_all.png">Accuracy Results</a> file.</li>
<li>Robustness Plots for all Experiments: Graph entropy values for structures of DANNs and their corresponding predictive performance under various types and levels of insults are given in the figures for each dataset (<a href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs/corr_acc_ent_Res18_ImageNet.png">ImageNet</a>, <a href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs/corr_acc_ent_Res18_TinyImageNet.png">Tiny-ImageNet</a>, and <a href="/Waasem/RobDanns/blob/main/corr_acc_ent_CNN_Cifar100_Cifar10.png">CIFAR</a>). Results from additional simulations are given in the <a href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs/supplementary_figs">Supplementary Figs</a> directory. For graph curvature vs. accuracy analysis, please turn to Appendix C of our paper.</li>
<li>Task and Model Complexity Plots: The effect of graph entropy on DANNs having varying depth as well on tasks having varying complexity is given in the figure <a href="/Waasem/RobDanns/blob/main/deep_learning/docs/figs/task_model_complexity_plots.png">Complexity Plots</a>. One can notice that as the complexity of the model and/or dataset increases, the importance of entropy as the robustness-measure of DANNs increases significantly.</li>
</ul>
<h2 dir="auto"><a id="user-content-citation" class="anchor" aria-hidden="true" href="#citation"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Citation</h2>
<p dir="auto">Shall be populated later.</p>
<h2 dir="auto"><a id="user-content-thank-you-" class="anchor" aria-hidden="true" href="#thank-you-"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Thank You !</h2>
<p dir="auto">Suggestions and improvements are welcome.</p>
</article>
