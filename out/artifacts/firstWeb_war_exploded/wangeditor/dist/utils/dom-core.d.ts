import Editor from '../editor/index';
/**
 * @description 封装 DOM 操作
 * @wangfupeng
 */
declare type OffsetDataType = {
    top: number;
    left: number;
    width: number;
    height: number;
    parent: Element | null;
};
export declare class DomElement {
    selector: string;
    length: number;
    elems: HTMLElement[];
    dataSource: Map<string, any>;
    /**
     * 构造函数
     * @param selector 任一类型的选择器
     */
    constructor(selector: string);
    constructor(selector: DomElement);
    constructor(selector: HTMLElement);
    constructor(selector: Document);
    constructor(selector: HTMLCollection);
    constructor(selector: NodeList);
    constructor(selector: HTMLElement[]);
    /**
     * 获取元素 id
     */
    get id(): string;
    /**
     * 遍历所有元素，执行回调函数
     * @param fn 回调函数
     */
    forEach(fn: Function): DomElement;
    /**
     * 克隆元素
     * @param deep 是否深度克隆
     */
    clone(deep?: boolean): DomElement;
    /**
     * 获取第几个元素
     * @param index index
     */
    get(index?: number): DomElement;
    /**
     * 获取第一个元素
     */
    first(): DomElement;
    /**
     * 获取最后一个元素
     */
    last(): DomElement;
    /**
     * 绑定事件
     * @param type 事件类型
     * @param selector DOM 选择器
     * @param fn 事件函数
     */
    on(type: string, fn: Function): DomElement;
    on(type: string, selector: string, fn: Function): DomElement;
    /**
     * 解绑事件
     * @param type 事件类型
     * @param selector DOM 选择器
     * @param fn 事件函数
     */
    off(type: string, fn: Function): DomElement;
    off(type: string, selector: string, fn: Function): DomElement;
    /**
     * 设置/获取 属性
     * @param key key
     * @param val value
     */
    attr(key: string): string;
    attr(key: string, val: string): DomElement;
    /**
     * 添加 css class
     * @param className css class
     */
    addClass(className: string): DomElement;
    /**
     * 添加 css class
     * @param className css class
     */
    removeClass(className: string): DomElement;
    /**
     * 是否有传入的 css class
     * @param className css class
     */
    hasClass(className?: string): boolean;
    /**
     * 修改 css
     * @param key css key
     * @param val css value
     */
    css(key: string, val: string | number): DomElement;
    /**
     * 封装 getBoundingClientRect
     */
    getBoundingClientRect(): DOMRect;
    /**
     * 显示
     */
    show(): DomElement;
    /**
     * 隐藏
     */
    hide(): DomElement;
    /**
     * 获取子节点（只有 DOM 元素）
     */
    children(): DomElement | null;
    /**
     * 获取子节点（包括文本节点）
     */
    childNodes(): DomElement | null;
    /**
     * 增加子节点
     * @param $children 子节点
     */
    append($children: DomElement): DomElement;
    /**
     * 移除当前节点
     */
    remove(): DomElement;
    /**
     * 当前元素，是否包含某个子元素
     * @param $child 子元素
     */
    isContain($child: DomElement): boolean;
    /**
     * 获取当前元素的尺寸和位置信息
     */
    getSizeData(): DOMRect;
    /**
     * 获取当前元素 nodeName
     */
    getNodeName(): string;
    /**
     * 获取当前元素可视高度
     */
    getClientHeight(): number;
    /**
     * 获取当前元素可视宽度
     */
    /**
     * 查询
     * @param selector css 选择器
     */
    find(selector: string): DomElement;
    /**
     * 获取/设置 元素 text
     * @param val text 值
     */
    text(): string;
    text(val: string): DomElement;
    /**
     * 设置/获取 元素 html
     * @param val html 值
     */
    html(): string;
    html(val: string): DomElement;
    /**
     * 获取元素 value
     */
    val(): string;
    /**
     * focus 到当前元素
     */
    focus(): DomElement;
    /**
     * 当前元素前一个兄弟节点
     */
    prev(): DomElement;
    /**
     * 当前元素后一个兄弟节点
     */
    next(): DomElement;
    /**
     * 获取父元素
     */
    parent(): DomElement;
    /**
     * 查找父元素，知道满足 selector 条件
     * @param selector css 选择器
     * @param curElem 从哪个元素开始查找，默认为当前元素
     */
    parentUntil(selector: string): DomElement | null;
    parentUntil(selector: string, curElem: HTMLElement): DomElement | null;
    /**
     * 判读是否相等
     * @param $elem 元素
     */
    equal($elem: DomElement | HTMLElement): boolean;
    /**
     * 将该元素插入到某个元素前面
     * @param selector css 选择器
     */
    insertBefore(selector: string | DomElement): DomElement;
    /**
     * 将该元素插入到某个元素后面
     * @param selector css 选择器
     */
    insertAfter(selector: string | DomElement): DomElement;
    /**
     * 设置/获取 数据
     * @param key key
     * @param value value
     */
    data<T>(key: string, value?: T): T | undefined;
    /**
     * 获取当前节点的顶级(段落)
     * @param editor 富文本实例
     */
    getNodeTop(editor: Editor): DomElement;
    /**
     * 获取当前 节点 基与上一个拥有相对或者解决定位的父容器的位置
     * @param editor 富文本实例
     */
    getOffsetData(): OffsetDataType;
}
declare function $(selector: any): DomElement;
export default $;
